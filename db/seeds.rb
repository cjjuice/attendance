# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.create( email: "yeah@foo.com", password: "yeah", password_confirmation: "yeah")

groups_list = ["Math Club", "Chi Phi", "Economics"]

groups_list.map! { |name| u.groups.create name: name }

attendees_list = [
  "Matt Kluny", 
  "Cliff Rebox", 
  "Roy Rojers", 
  "Biff Billery", 
  "Jane Jefferson"
]

groups_list.each do |group|
  attendees_list.sample(3).each do |name|
    group.attendees.create name: name
  end
end      
  
