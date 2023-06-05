# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.create!(
#   email: "",
#   password: 'password',
#   password_confirmation: 'password',
#   superadmin: true,
#   phone: "1231231235",
#   type: '',
#   role: "admin",
#   full_name: "Admin") if Rails.env.development?
require 'faker'


if Rails.env.production?
  User.create!(
    email: "",
    password: 'password',
    password_confirmation: 'password',
    superadmin: false,
    phone: "3213213213",
    type: 'Patient',
    role: "patient",
    full_name: "Ann Keen")
    
  User.create!(
    email: "",
    password: 'password',
    password_confirmation: 'password',
    superadmin: false,
    phone: "1231231231",
    type: 'Doctor',
    role: "doctor",
    full_name: "Dr John")
      
  User.create!(
    email: "",
    password: 'password',
    password_confirmation: 'password',
    superadmin: true,
    phone: "1231231235",
    type: '',
    role: "admin",
    full_name: "Admin")

    categories = [
      "Cardiologist",
      "Gynecologist",
      "Neurologist",
      "Dentist",
      "Orthopedic",
      "Pediatrician",
      "Endocrinologist",
      "Psychiatrist",
      "Endocrinologist",
      "Surgeon",
      "Dermatologist"
    ]
    
    categories.each do |category_name|
      Category.create!(name: category_name)
    end
      
        
  10.times do
  doctor = User.new(
        email: "",
        password: Faker::Internet.password,
        superadmin: false,
        phone: Faker::PhoneNumber.phone_number,
        type: 'Doctor',
        role: "doctor",
        full_name: Faker::Name.name)
  
    if doctor.role == "doctor"
      doctor.category = Category.all.sample
    end
    doctor.save!
  end

  10.times do
  patient = User.create!(
      email: "",
      password: Faker::Internet.password,
      superadmin: false,
      phone: Faker::PhoneNumber.phone_number,
      type: 'Patient',
      role: "patient",
      full_name: Faker::Name.name)
    end
end


