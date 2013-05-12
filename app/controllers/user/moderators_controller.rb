class User::ModeratorsController < EditController
  def update
    resource = User::Moderator.find params[:id]

    if !params[:user_moderator][:password].blank?
      redirect_to collection_path
    elsif resource.update_without_password params[:user_moderator]
      redirect_to collection_path
    else
      render :edit
    end
  end
end
