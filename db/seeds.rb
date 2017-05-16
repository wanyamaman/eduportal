# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add admin based on environmental values using a services
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Data pool
school_names = ['Mackenzie', 'Kitengela', 'Barbie', 'Langata', 'Buru Buru', 'School of Rock', 'Clifton']
genders = ['male', 'female', 'mixed']
ownership = ['private', 'public']
levels = ['primary', 'secondary', 'pre-school', 'all', 'other']
modes = ['day', 'boarding', 'mixed']
schools = []


# locations = []

# Create states
5.times do
  State.create(name: Faker::Address.state)
end


# Create schools
school_names.each { |school|
  schools << School.create(
    name: school,
    email: Faker::Internet.unique.safe_email,
    ownership: ownership.sample,
    level: levels.sample,
    mode: modes.sample,
    gender: genders.sample,
    about: Faker::Lorem.paragraph,
    phone: Faker::Number.number(7)
  )
}
