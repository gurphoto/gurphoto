require 'csv'

class Hotel::ImportController < ApplicationController
  before_filter do
    raise CanCan::AccessDenied if current_user.nil? or !current_user.super_admin?
  end

  def index
  end

  def create
    file_data = params[:import][:csv]
    contents = nil

    @import_count = 0
    @all_import_count = 0
    @errors = []

    if file_data.respond_to? :read
      contents = file_data.read
    elsif file_data.respond_to? :path
      contents = File.read file_data.path
    end

    if contents
      CSV.parse(contents) do |row|
        @all_import_count += 1
        success, message = Hotel.create_from_csv_row(row)

        if success
          @import_count += 1
        else
          @errors << message
        end
      end
    end

    render :index
  end
end
