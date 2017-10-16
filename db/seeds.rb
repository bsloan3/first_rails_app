# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all

user = User.create!(email: 'brad@brad.com', password: 'brad')

user.posts.create!(title: 'sample title', body: 'this is a sample post')
user.posts.create!(title: 'sample title 2', body: 'this is a second sample post')