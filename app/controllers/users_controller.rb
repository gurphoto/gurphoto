class UsersController < InheritedResources::Base
  include InheritedResources::DSL

  load_and_authorize_resource

  update! do |success, failure|
    success.html { redirect_to root_path, flash: { notice: t('change_settings') } }
  end

  def update
    resource = User.find params[:id]
    user_params = params[:user] || params[:user_moderator] || params[:user_agency] || params[:user_hotelier] || params[:user_tourist]

    if !user_params[:password] and resource.update_without_password user_params
      redirect_to root_path
    elsif resource.update_attributes user_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def save_hotel_search_query
    resource.update_attributes save_hotel_search_query: params[:save_hotel_search_query] == '1' ? true : false
    render json: { success: true }
  end

  def resource
    @resource ||= User.find params[:id]
  end
end
