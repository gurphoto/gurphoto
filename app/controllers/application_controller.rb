class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do |c|
    User.current_user = c.current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: t(exception.message.parameterize.underscore)
  end

  rescue_from Exception, with: :render_500 if Rails.env == 'production'
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActionController::UnknownController, with: :render_404
  rescue_from AbstractController::ActionNotFound, with: :render_404
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def authenticate_admin_user!
    authenticate_user!

    #cancan must redirect incurrect user
    #unless current_user.admin?
    #  redirect_to root_path
    #end
  end

  private

  def render_404(exception)
    @not_found_path = exception.message
    respond_to do |format|
      format.html { render template: 'errors/error_404', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def render_500(exception)
    @error = exception
    respond_to do |format|
      format.all { render nothing: true, status: 500}
    end
  end
end
