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

# Each user gets a bunch of random microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
  
end

# Arrays for Vehicle/Ride information
make_array = ['Beta', 'BMW', 'GasGas', 'Yamaha', 'Kawasaki', 'Honda','KTM', 'Suzuki', 'Husqvarna','Sherco', 'TM', 'Ossa']
uom_array = ['Hours', 'Miles', 'Kilometers']
model_array = ['KX450', 'CRF450', 'YZ250', 'YZ250FX', 'F800GSA', '250SXF','350XC', 'RM125', 'TE300','EC250', '250RR', 'TXT280']
year_array = (2000..2015).to_a
category_array = ['Dirt Bike', 'Street', 'UTV', 'ATV', 'Cruiser', 'Dual Sport','Adventure', 'Snowmobile']
users_array = [1,2,3,4,5,6,7]


# Create 15 default vehicles
15.times do |n|
    make = make_array.sample
    model = model_array.sample
    year = year_array.sample
    category = category_array.sample
    Vehicle.create!(make: make, model: model, year: year, category: category)
end

# Create 50 rides associated with random users
50.times do |n|
    name = Faker::Name.first_name
    make = make_array.sample
    model = model_array.sample
    year = year_array.sample
    unit_of_measurement = uom_array.sample
    category = category_array.sample
    is_private = false
    # picture = File.open(Dir.glob(File.join(Rails.root, 'Seed_pictures', '*')).sample)
    user_id = users_array.sample
    Ride.create!(make: make, model: model, year: year, category: category, is_private: is_private, user_id: user_id, name: name, unit_of_measurement: unit_of_measurement)
end




# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }