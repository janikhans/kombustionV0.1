User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: "Janik Knittle",
             email: "janik.knittle@gmail.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
               
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
  
end

5.times do
    name = Faker::Name.name
    make = Faker::Name.first_name
    model = Faker::Name.last_name
    year = Faker::Number.number(4)
    unit_of_measurement = Faker::Lorem.word
    category = Faker::Name.first_name
  users.each { |user| user.vehicles.create!(name: name, make: make, model: model, year: year, category: category, unit_of_measurement: unit_of_measurement) }
  
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }