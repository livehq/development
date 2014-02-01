# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.where(id: 1).first_or_create!{|u|
  u.id = 1
  u.name = ENV['DEFAULT_ADMIN_USERNAME'].dup
  u.password = ENV['DEFAULT_ADMIN_PASSWORD'].dup
  u.email = ENV['DEFAULT_ADMIN_EMAIL'].dup
}
