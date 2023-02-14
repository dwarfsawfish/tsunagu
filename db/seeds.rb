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

  User.create!(nickname: ENV["USER_NICKNAME"],
    email: ENV["USER_EMAIL"],
    password: ENV["USER_PASSWORD"],
    password_confirmation: ENV["USER_PASSWORD_CONFIRMATION"],
    last_name: ENV["USER_LAST_NAME"],
    first_name: ENV["USER_FIRST_NAME"],
    admin: false)

    Company.create!(company_name: ENV["COMPANY_NAME"],
      email: ENV["COMPANY_EMAIL"],
      password: ENV["COMPANY_PASSWORD"],
      password_confirmation: ENV["COMPANY_PASSWORD_CONFIRMATION"],
      category_id: ENV["COMPANY_CATEGORY"],
      prefecture_id: ENV["COMPANY_PREFECTURE"],
      city: ENV["COMPANY_CITY"],
      house_number: ENV["COMPANY_HOUSE_NUMBER"],
      last_name: ENV["COMPANY_LAST_NAME"],
      first_name: ENV["COMPANY_FIRST_NAME"])