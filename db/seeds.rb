# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Admin.find_or_initialize_by(email: "admin@example.com").tap do |admin|
  admin.password = "admin@example.com"
  admin.save!
end

if User.find_by(email: "cdpobre@yahoo.com").nil?
  User.invite!(email: "cdpobre@yahoo.com"){|u| u.skip_invitation = true}
  User.accept_invitation! invitation_token: User.last.invitation_token
end
