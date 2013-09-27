class StaticController < ApplicationController
  before_filter :auth_user!, except: [:request_invitation]
  def request_invitation
    @hi = "Request for Invitation"
  end

  def welcome
    @hi = "Hello World!!!!"
  end

private
  def auth_user!(options = {})
    if admin_signed_in?
      authenticate_admin!
    else
      authenticate_user!
    end
  end
end
