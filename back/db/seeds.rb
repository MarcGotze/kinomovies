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

tag_names = [
  "Action", "Adventure", "Animation", "Comedy", "Crime",
  "Documentary", "Drama", "Family", "Fantasy", "History",
  "Horror", "Music", "Mystery", "Romance", "Science Fiction",
  "TV Movie", "Thriller", "War", "Western"
]

# Boucle pour créer les tags
tag_names.each do |tag_name|
  tag = Tag.create(name: tag_name)
  puts tag.name
end

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
