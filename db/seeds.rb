# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Test', last_name: 'User', email: 'testuser@gmail.com', password: 'password')

['The Hindu', 'The Times of India', 'Hindustan Times'].each do |agency|
  Agency.create(name: agency)
end

['National', 'Business', 'Sports', 'Entertainment', 'International'].each do |category|
  Category.create(title: category)
end