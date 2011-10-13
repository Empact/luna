class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    params[:return_to] || super
  end

  def permission_denied
    if !user_signed_in?
      flash.alert = "You must sign in to access that page"
      redirect_to new_user_session_path(return_to: request.url)
    else
      super
    end
  end
end
