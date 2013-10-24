class StaticController < ApplicationController
  before_action :auth_user!, except: [:request_invitation]
  def request_invitation
    @hi = "Request for Invitation"
  end

  def welcome
    @hi = "Hello World!!!!"
  end
end
