class User::HoteliersController < EditController
  helper_method :sort_direction, :sort_column

  def update
    if params[:user_hotelier][:password].empty? and resource.update_without_password params[:user_hotelier]
      redirect_to collection_path
    elsif resource.update_attributes params[:user_hotelier]
      redirect_to collection_path
    else
      render :edit
    end
  end

  private

  def collection
    @collection ||= end_of_association_chain
      .includes(:profile)
      .includes(:hotelier_hotels)
      .order("#{sort_column} #{sort_direction}")
      .paginate(:page => params[:page])
  end

  def sort_column
    User::Hotelier.sort_column_names.include?(params[:sort]) ? params[:sort] : "profiles.company_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
