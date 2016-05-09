require 'ffaker'

puts "Seeding Database!"

User.destroy_all
City.destroy_all
Post.destroy_all

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
puts "Seeded #{u.count} users."

puts "-----------"

admin = User.create({
  first_name: "admin",
  last_name: "admin",
  current_city: "Adminlandia",
  email: "admin@vagabond.com",
  username: "admin",
  password: "admin",
  active: true,
  profile_picture: "http://www.clipartbest.com/cliparts/9cR/Rj9/9cRRj9Aoi.svg"
})

puts "Seeded the admin account with id #{admin.id}."

puts "-----------"

City.create({name: "San Francisco", photo:"https://images.unsplash.com/photo-1423347673683-ccdb7f6a948f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&s=f6afff6e20e207bbe89356e92770c86a"})
City.create({name: "Gibraltar", photo:"http://static.guim.co.uk/sys-images/Football/Clubs/Club_Home/2013/11/19/1384870207734/Gibraltar-will-play-their-014.jpg"})
City.create({name: "London", photo:"https://images.unsplash.com/photo-1428342628092-61f9e5d578f2?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&s=1d95bbe1b676b1e8535139bb4ce735d8"})
City.create({name: "Chicago", photo:"https://images.unsplash.com/photo-1462121594302-c1ed6b9ab32d?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&s=c07c1848e33625c3021f01eed2bc6b1c"})
City.create({name: "New York", photo:"https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d"})
City.create({name: "Los Angeles", photo:"https://images.unsplash.com/photo-1444723121867-7a241cacace9?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&s=267ac8364bdee3c7020b8c4da3596b07"})
City.create({name: "Boston", photo:"https://images.unsplash.com/photo-1461253205884-5aa82520ee48?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&s=67113380cad241527e09b4f41dcade55"})
City.create({name: "Tokyo", photo:"https://images.unsplash.com/photo-1443170412500-d04323a4eb57?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&s=963d78ab6f5007441822fa9af299c0f7"})
City.create({name: "Cairo", photo:"https://singbiker.files.wordpress.com/2012/07/img_1760-55x29.jpg"})
City.create({name: "Managua", photo:"http://static.panoramio.com/photos/large/36396637.jpg"})
City.create({name: "Austin", photo:"https://upload.wikimedia.org/wikipedia/commons/0/06/AustinSkylineLouNeffPoint-2010-03-29-b.JPG"})
City.create({name: "São Paulo", photo:"https://www.portobay.com/media/71336/cropAlignTop-1280-800-Sao-Paulo-Altino-Arantes-Building-Jefferson-Pancieri.jpg"})

cities = City.all

puts "Seeded #{cities.count} cities."

puts "-----------"

cities.each do |city|
  15.times do
    city.posts.push(
    Post.create({
      title: city.name + "'s " + FFaker::CheesyLingo.title,
      content: "In #{city.name}, " + FFaker::CheesyLingo.paragraph,
      user_id: admin[:id]
    })
    )
  end
end

puts "All of the cities have 15 starter posts. Seeding done!"
