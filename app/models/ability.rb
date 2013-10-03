class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Admin.new
    alias_action :create, :read, :update, :destroy, to: :crud

    if Admin.where(user.id).present?
      can :crud, :all
    end
  end
end
