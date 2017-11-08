
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create name: "teacher", email: "admin@gmail.com", role: "admin", password: "12345678", password_confirmation: "12345678"
4.times do |n|
  User.create name: "student#{n}", email: "student#{n}@gmail.com", password: "12345678", password_confirmation: "12345678"
end

Thesis.create name: "Thesis 1", description: "Detail thesis 1", progress: "0%", status: 0, user_id: 1

Thesis.create name: "Thesis 2", description: "Detail thesis 2", progress: "0%", status: 1, user_id: 1

Task.create name: "Task for thesis 1", status: 1, thesis_id: 2

Task.create name: "Task for thesis 2", status: 0, thesis_id: 2
