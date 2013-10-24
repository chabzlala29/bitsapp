class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :config_permit_params, if: :devise_controller?

  #String.class_eval do
    #def pluralize(num=2)
      #ActiveSupport::Inflector.pluralize(self, num)
    #end
  #end

  protected
  def authenticate_inviter!
    authenticate_admin!(force: true)
  end

  def auth_user!(options = {})
    if admin_signed_in?
      authenticate_admin!
    else
      authenticate_user!
    end
  end
  def config_permit_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
  end
end
