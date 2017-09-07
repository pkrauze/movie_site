# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
OrderItem.delete_all

Director.delete_all
Director.create! id: 1, firstname: "J. J.", lastname: "Abrams", year_of_birth: 1996


Movie.delete_all
Movie.create! id: 1, title: "Star Wars VII", desc: "Star Wars Desc", year: 2016, time: 136, director_id: 1, price: 9.99

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"



