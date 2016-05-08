require 'ffaker'

puts "Seeding Database..."

User.destroy_all
user_data = []

10.times do
  user_data << {
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    current_city: FFaker::Address.city,
    email: FFaker::Internet.safe_email,
    username: FFaker::Internet.user_name,
    password: "boom",
    active: true,
    profile_picture: "https://community.saltmoney.org/6.0.5.f76dfc4/images/jive-profile-default-portrait.png"
  }
end


u = User.create(user_data) # array of all created users
puts "Seeded #{u.count} Users"

puts "-----------"

Post.destroy_all

first = User.first

the_post = Post.create ({
   title: FFaker::CheesyLingo.title,
   content: FFaker::CheesyLingo.paragraph
})

first.posts.push(the_post)

puts "first user has post"
