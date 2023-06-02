# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.create!(phone: '1231231231', password: 'password', password_confirmation: 'password', superadmin: true, full_name: "Admin") if Rails.env.development?
require 'faker'


# categories = [
#   "Gynecologist",
#   "Neurologist",
#   "Dentist",
#   "Orthopedic",
#   "Pediatrician",
#   "Endocrinologist",
#   "Psychiatrist",
#   "Endocrinologist",
#   "Surgeon",
#   "Dermatologist"
# ]

# categories.each do |category_name|
#   Category.create!(name: category_name)
# end

User.create!(
  email: "",
  password: 'password',
  password_confirmation: 'password',
  superadmin: true,
  phone: "1112223333",
  type: 'Patient',
  role: "patient",
  full_name: "Ann Keen")

User.create!(
  email: "",
  password: 'password',
  password_confirmation: 'password',
  superadmin: true,
  phone: "1112223331",
  type: 'Doctor',
  role: "doctor",
  full_name: "Dr John")

  
if Rails.env.production?
  User.create!(
    email: "",
    password: 'password',
    password_confirmation: 'password',
    superadmin: true,
    phone: "1231231235",
    type: '',
    role: "admin",
    full_name: "Admin")

  
#   10.times do
#   doctor = User.new(
#       email: "",
#       password: Faker::Internet.password,
#       superadmin: false,
#       phone: Faker::PhoneNumber.phone_number,
#       type: 'Doctor',
#       role: "doctor",
#       full_name: Faker::Name.name)
  
#       if doctor.role == "doctor"
#         doctor.category = Category.all.sample
#       end
#       doctor.save!
#     end

#   10.times do
#   patient = User.create!(
#       email: "",
#       password: Faker::Internet.password,
#       superadmin: false,
#       phone: Faker::PhoneNumber.phone_number,
#       type: 'Patient',
#       role: "patient",
#       full_name: Faker::Name.name)
#     end
end


