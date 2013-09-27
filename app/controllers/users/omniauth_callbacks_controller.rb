class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    @user = User.where(email: @user.email).first unless @user.persisted?
    
    if @user.persisted? && User.invitation_accepted.include?(@user)
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to request_invitation_static_index_path, notice: "You have to ask the Admin to invite you!"
    end
  end
end
