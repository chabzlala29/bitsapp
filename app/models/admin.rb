class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable
  include DeviseInvitable::Inviter

  has_many :invitations, class_name: 'User', as: :invited_by
end
