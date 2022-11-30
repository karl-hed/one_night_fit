# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_names = %w[F D J-F Isa]
last_names = %w[A-A B-B C-C D-D]
emails = %w[b@b.com c@c.com d@d.com e@e.com]

puts "Creating users"

index = 0

4.times do
  User.create!(
    first_name: first_names.sample,
    last_name: last_names.sample,
    password: '123456',
    email: emails[index]
  )
  index += 1
end

categories = %w[fashion used new modern]
names = %w[jean sweater hoodie pants]
price = (1..10).to_a
description = %w[never\ worn brand\ new old\ school]

puts "Creating articles"
4.times do
  Article.create!(
    category: categories.sample,
    name: names.sample,
    price: price.sample,
    description: description.sample,
    user: User.find_by(email: 'c@c.com')
  )
end

comments = %w[very\ good happy good\ purchase bad\ product]
statuses = (0..2).to_a

puts "Creating bookings"
4.times do
  Booking.create!(
    comment: comments.sample,
    status: statuses.sample,
    user: User.find_by(email: 'c@c.com'),
    article: Article.find_by(id: 1)
  )
end
