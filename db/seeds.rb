# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: "bensdecker+1@gmail.com", type: "admin")
User.create(email: "bensdecker+2@gmail.com", type: "employee")
User.create(email: "bensdecker+1@gmail.com", type: "member")