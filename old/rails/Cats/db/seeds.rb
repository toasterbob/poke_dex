# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ranch_house = House.create(house_type: "Ranch House")
beach_house = House.create(house_type: "Beach House")

sarah = Cat.create(name: "Sarah", color: "black", house_id: ranch_house.id)
jeff = Cat.create(name: "Jeff", color: "orange", house_id: beach_house.id)

Toy.create(name: "Yarn", cat_id: sarah.id)
Toy.create(name: "Squeaker", cat_id: sarah.id)
Toy.create(name: "Feather", cat_id: jeff.id)
Toy.create(name: "Ball", cat_id: jeff.id)

100000.times do
  Cat.create!(name: Faker::Name.first_name, color: :orange)
end 
