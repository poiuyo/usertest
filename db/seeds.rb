# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all


Product.create!([
  {id:1, name: "Nintendo",price: 250},
  {id:2, name: "xbox", price: 350.22},
  {id:3, name: "ps4", price: 450.22}
])
