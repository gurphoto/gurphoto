class User::CampersController < EditController
  helper_method :sort_direction, :sort_column

  def update
    if params[:user_camper][:password].empty? and resource.update_without_password params[:user_camper]
      redirect_to collection_path
    elsif resource.update_attributes params[:user_camper]
      redirect_to collection_path
    else
      render :edit
    end
  end

  private

  def collection
    @collection ||= end_of_association_chain
    .includes(:profile)
    .order("#{sort_column} #{sort_direction}")
    .paginate(:page => params[:page])
  end

  def sort_column
    User::Camper.sort_column_names.include?(params[:sort]) ? params[:sort] : "profiles.company_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
