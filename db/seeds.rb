# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do
  User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
end

30.times do
  Body.create!(name: Faker::Company.name, description: Faker::Lorem.paragraph, created_by: User.order('random()').first)
end
