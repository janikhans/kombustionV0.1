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

make_array = ['Beta', 'BMW', 'GasGas', 'Yamaha', 'Kawasaki', 'Honda','KTM', 'Suzuki', 'Husqvarna','Sherco', 'TM', 'Ossa']
uom_array = ['Hours', 'Miles', 'Kilometers']
model_array = ['KX450', 'CRF450', 'YZ250', 'YZ250FX', 'F800GSA', '250SXF','350XC', 'RM125', 'TE300','EC250', '250RR', 'TXT280']
year_array = (2000..2015).to_a

5.times do
    name = Faker::Name.first_name
    make = make_array.sample
    model = model_array.sample
    year = year_array.sample
    unit_of_measurement = uom_array.sample
    category = Faker::Name.first_name
    is_private = false
    picture = Faker::Avatar.image
  users.each { |user| user.rides.create!(name: name, make: make, model: model, year: year, category: category, unit_of_measurement: unit_of_measurement, is_private: is_private, picture: picture) }
  
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }