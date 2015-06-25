# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

ksenia = User.create(email:"ksenia@example.com", phone_number: "3473244140", name:"Ksenia",password:"password", password_confirmation: "password")
ksusha = User.create(email:"ksusha@example.com", phone_number: "3473244140", name: "Ksusha",password:"password", password_confirmation: "password")
kay = User.create(email:"kay@example.com",phone_number: "3473244140", name: "Kay",password:"password", password_confirmation: "password")
