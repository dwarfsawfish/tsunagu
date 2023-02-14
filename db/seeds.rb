# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(nickname: ENV["ADMIN_NICKNAME"],
  email: ENV["ADMIN_EMAIL"],
  password: ENV["ADMIN_PASSWORD"],
  password_confirmation: ENV["ADMIN_PASSWORD_CONFIRMATION"],
  last_name: ENV["ADMIN_LAST_NAME"],
  first_name: ENV["ADMIN_FIRST_NAME"],
  admin: true)