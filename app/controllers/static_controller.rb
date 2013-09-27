class StaticController < ApplicationController
  before_filter :auth_user!

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
