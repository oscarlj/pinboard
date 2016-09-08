# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Nationality.destroy_all
Country.destroy_all
City.destroy_all
Board.destroy_all
Post.destroy_all
Comment.destroy_all

u = User.create!(name:'oscar', email:'oscarljnos@gmail.com', password:'password')
n = Nationality.create!(name: 'chile', gentility: 'chileno')
c = City.create!(name: 'santiago')
p = Country.create!(name:'chile')
b = Board.create!(names:'pinboard santiago')
ps = Post.create!(title:'blabla', content: 'Flannel pabst pork belly craft beer listicle. Poutine squid raw denim, photo booth kale chips lumbersexual pabst iPhone banjo irony man braid kombucha freegan.')
co = Comment.create!(content:'Flannel pabst pork belly craft beer listicle. Poutine squid raw denim, photo booth kale chips lumbersexual pabst iPhone banjo irony man braid kombucha freegan.')
cat = Category.create!([{name:"For Sale"},{name: "Events"}])




