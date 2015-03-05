# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


TodoList.destroy_all


first_list = TodoList.create(title: "My Monday todo",
               description: 'What i must do in first day of the week')
first_list.tasks.create(content: "Wake UP")
first_list.tasks.create(content: "Brush teeth")
first_list.tasks.create(content: "SMART Toilet water choice")

