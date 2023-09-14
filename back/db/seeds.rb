# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Tag.destroy_all
User.destroy_all

puts "=========================================================================="
puts "Creating tags..."
puts "=========================================================================="

tag = Tag.create(
  name: "Action"
)
puts tag.name

tag = Tag.create(
  name: "Adventure"
)
puts tag.name

tag = Tag.create(
  name: "Animation"
)
puts tag.name

tag = Tag.create(
  name: "Comedy"
)
puts tag.name

tag = Tag.create(
  name: "Crime"
)
puts tag.name

tag = Tag.create(
  name: "Documentary"
)
puts tag.name

tag = Tag.create(
  name: "Drama"
)
puts tag.name

tag = Tag.create(
  name: "Family"
)
puts tag.name

tag = Tag.create(
  name: "Fantasy"
)
puts tag.name

tag = Tag.create(
  name: "History"
)
puts tag.name

tag = Tag.create(
  name: "Horror"
)
puts tag.name

tag = Tag.create(
  name: "Music"
)
puts tag.name

tag = Tag.create(
  name: "Mystery"
)
puts tag.name

tag = Tag.create(
  name: "Romance"
)
puts tag.name

tag = Tag.create(
  name: "Science Fiction"
)
puts tag.name

tag = Tag.create(
  name: "TV Movie"
)
puts tag.name

tag = Tag.create(
  name: "Thriller"
)
puts tag.name

tag = Tag.create(
  name: "War"
)
puts tag.name

tag = Tag.create(
  name: "Western"
)
puts tag.name

puts "=========================================================================="
puts "Tags completed !"
puts "=========================================================================="

puts "=========================================================================="
puts "Creating Users..."
puts "=========================================================================="

20.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    image_path: Faker::Avatar.image
  )

  liked_tags = Tag.all.sample(rand(3..5))
  disliked_tags = Tag.all.sample(rand(3..5))

  disliked_tags -= liked_tags

  liked_tags.each do |tag|
    user.liked_tags.build(tag: tag)
  end

  disliked_tags.each do |tag|
    user.disliked_tags.build(tag: tag)
  end

  user.save(validate: false)
  puts user.username
end

puts "=========================================================================="
puts "Users completed !"
puts "=========================================================================="
