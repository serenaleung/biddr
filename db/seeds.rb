# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Serena", email: "s@e.com", password: "123", password_confirmation: "123")


# Create users
3.times do
  User.create(name: Faker::Name.first_name,
              email: Faker::Internet.email,
              password: '123',
              password_confirmation: '123'
  )
  puts "User created!"
end

# Create Auctions
30.times do
  user = User.all.sample

  a = Auction.create(title: Faker::App.name,
                     details: Faker::Hipster.paragraph,
                     reserve_price: rand(100),
                     user_id: user.id,
                     end_date: Faker::Date.backward(14),
                     current_price: 1
  )
  puts "Auction created!"
end

# Create Bids
Auction.all.each do |auction|
  5.times do
    user = User.all.sample

    auction.bids.create(
                        price: rand(110),
                        user_id: user.id,
                        auction_id: auction.id
    )
    puts "Bid created!"
  end
end
