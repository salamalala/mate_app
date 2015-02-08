# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
User.create!(first_name:"Nina", last_name: "Regli", email:"nina@ga.com", password:"password", role: "admin")
User.create!(first_name:"Sebastian", last_name: "Riddle", email:"sebastian@ga.com", password:"password")
User.create!(first_name:"Sadiq", last_name: "Okocha",  email:"sadiq@ga.com", password:"password")
User.create!(first_name:"Joel", last_name: "Pickup",  email:"joel@ga.com", password:"password")
User.create!(first_name:"Ellie", last_name: "McGregor",  email:"ellie@ga.com", password:"password")
User.create!(first_name:"Sophie", last_name: "Allaoua",  email:"sophie@ga.com", password:"password")
User.create!(first_name:"Tony", last_name: "Goncalves",  email:"tony@ga.com", password:"password")
User.create!(first_name:"Luke", last_name: "Grayland",  email:"luke@ga.com", password:"password")
User.create!(first_name:"Bruno", last_name: "Vinel", email:"bruno@ga.com", password:"password")
User.create!(first_name:"Michael", last_name: "Pavling", email:"michael@ga.com", password:"password")
User.create!(first_name:"Gery", last_name: "Mathe", email:"gery@ga.com", password:"password")
User.create!(first_name:"Jarkyn", last_name: "S-somthing", email:"jarkyn@ga.com", password:"password")
User.create!(first_name:"Alex", last_name: "Chin", email:"alex@ga.com", password:"password") 
User.create!(first_name:"Johanna", last_name: "Carlberg", email:"johanna@ga.com", password:"password")
User.create!(first_name:"Lexie", last_name: "Papaspyrou", email:"lexie@ga.com", password:"password")



Journey.delete_all
Journey.create!(start_date: "2015-03-15", end_date: "2015-03-22", title: "From Athen to Istanbul", deal: "help us on the boat with all kind of things", berth: 4)
Journey.create!(start_date: "2015-04-15", end_date: "2015-04-22", title: "Norwegen - Lofoten",  deal: "help us on the boat with all kind of things f.ex cooking and sailing", berth: 6)
