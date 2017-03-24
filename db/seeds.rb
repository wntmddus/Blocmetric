require 'Faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(
  email:  'admin@example.com',
  password:'helloworld',
  role:    'admin'
)
admin.save!

standard = User.create!(
  email:  'standard@example.com',
  password:'helloworld',
  role: 'standard'
)
standard.save!

developer = User.create!(
  email: 'developer@example.com',
  password: 'helloworld',
  role: 'developer'
)
developer.save!
users = User.all
10.times do
  application = RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Company.name,
    url: Faker::Internet.url
  )
end

applications = RegisteredApplication.all


50.times do
  event = Event.create!(
    registered_application: applications.sample,
    name: Faker::University.name
  )
end
applciation = RegisteredApplication.create!(
  user: users.sample,
  name: "Hello",
  url: "http://registered_application.com"
)


puts "#{RegisteredApplication.count} Applications created"
puts "#{Event.count} events created"
