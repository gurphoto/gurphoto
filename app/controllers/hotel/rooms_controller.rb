class Hotel::RoomsController < InheritedResources::Base
  include InheritedResources::DSL

  update! do |success, failure|
    success.html { redirect_to hotel_path(parent) + '/rooms' }
  end

  create! do |success, failure|
    success.html { redirect_to hotel_path(parent) + '/rooms' }
  end

  def show
    render layout: false
  end
end
