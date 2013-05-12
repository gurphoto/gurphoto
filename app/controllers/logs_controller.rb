class LogsController < ApplicationController
  helper_method :collection

  load_and_authorize_resource class: ChangeLogs

  def index
  end

  private

  def collection
    @collection ||= ChangeLogs.paginate(page: params[:page], per_page: 50).all
  end
end
