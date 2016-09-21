# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all
User.destroy_all
Nationality.destroy_all
Country.destroy_all
City.destroy_all
Board.destroy_all
Comment.destroy_all


195.times do |l|
	 name = Faker::Address.country

	 Nationality.create!(name: name)


	end




1000.times do |n|

	name = Faker::Name.name
	email = Faker::Internet.email
	password = Faker::Internet.email
	latitude = Faker::Address.latitude
	longitude = Faker::Address.longitude
	nationality = Nationality.all
	nationality = nationality.sample

	User.create!(name: name,
		email: email,
		password: password,
		latitude: latitude,
		longitude: longitude,
		nationality_id: nationality.id
		)

end

195.times do |c|

 name = Faker::Address.country 

 count = Country.create!(name: name)

  1.times do |city|

  	cit = City.create!(name: Faker::Address.city, country_id: count.id)

    Board.create!(city_id: cit.id, names: cit.name )

  end

end





2000.times do |p|

	title = Faker::Book.title
	content = Faker::Hipster.paragraphs(1)
	category = Category.all
	category = category.sample
	board = Board.all
	board = board.sample
	user = User.all
	user = user.sample

	Post.create!(title: title, 
				content: content,
				 category_id: category.id,
				 board_id: board.id,
				 user_id: user.id)
end

4000.times do |y|

	content = Faker::Hipster.paragraphs
	user = User.all
	user = user.sample
	post = Post.all
	post = post.sample

	Comment.create!(content: content, user_id: user.id, post: post.id)


end

#create_table "posts", force: :cascade do |t|
#    t.string   "title"
#    t.text     "content"
#    t.date     "date"
#    t.integer  "category_id"
#    t.integer  "board_id"
#    t.datetime "created_at",  null: false
#    t.datetime "updated_at",  null: false
#    t.integer  "user_id"



