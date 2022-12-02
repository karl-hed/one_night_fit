# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Booking.destroy_all
Article.destroy_all
User.destroy_all

first_names = %w[Frank Dom Jean-Francois Isabelle]
last_names = %w[Tremblay Beaulieu Allard Daniel]
emails = %w[frank_tremblay@lewagon.com dom_beaulieu@lewagon.com jean-francois_allard@lewagon.com isabelle_daniel@lewagon.com]

puts "Creating users"

index = 0

4.times do
  User.create!(
    first_name: first_names[index],
    last_name: last_names[index],
    password: '123456',
    email: emails[index]
  )
  index += 1
end

categories = %w[fashion used new modern]
names = %w[jean sweater hoodie pants]
price = (1..10).to_a
description = %w[never\ worn brand\ new old\ school]

index = 0

puts "Creating articles"
4.times do
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")

  article = Article.create!(
    category: categories.sample,
    name: names.sample,
    price: price.sample,
    description: description.sample,
    user: User.find_by(id: index + 1)
  )

  article.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  index += 1
end

comments = %w[very\ good happy good\ purchase bad\ product]
statuses = (0..2).to_a

# index = 0

puts "Creating bookings"
2.times do
  Booking.create!(
    comment: comments.sample,
    status: statuses.sample,
    user: User.find_by(id: 1),
    article: Article.find_by(id: 1)
  )
  index -= 1
end
