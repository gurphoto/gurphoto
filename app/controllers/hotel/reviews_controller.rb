class Hotel::ReviewsController < InheritedResources::Base
  include InheritedResources::DSL

  load_and_authorize_resource

  update! do |success, failure|
    success.html { redirect_to collection_path }
  end

  def new
    resource.hotel_id = params[:hotel_id]
  end

  def create
    @resource = Hotel::Review.new params[:hotel_review]

    respond_to do |format|
      if (user_signed_in? and @resource.save) or @resource.save_with_captcha
        format.html { redirect_to hotel_path(resource.hotel), notice: t('add_review') }
      else
        format.html { render action: :new }
      end
    end
  end

  def resource
    @resource ||= Hotel::Review.find params[:id] if params[:id]
    @resource ||= Hotel::Review.new
  end

  def hotel
    Hotel.find (params[:hotel_id] || params[:hotel_review][:hotel_id])
  end

  helper_method :hotel
end
