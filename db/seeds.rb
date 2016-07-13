# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Data pool
school_names = ['Mackenzie', 'Kitengela', 'Barbie', 'Langata', 'Buru Buru', 'School of Rock', 'Clifton']
genders = ['male', 'female', 'mixed']
user_names = ['Brian', 'Mark', 'William', 'Sheh', 'Don', 'John', 'Makmende', 'Audrey', 'John', 'James', 'Smith', 'Were']
domains = ['co.ke', 'com', 'io', 'co.za', 'org','edu']
email_hosts = ['gmail', 'yahoo', 'eduportal', 'hotmail', 'ihub']
ownership = ['private', 'public']
levels = ['primary', 'secondary', 'pre-school', 'all', 'other']
modes = ['day', 'boarding', 'mixed']
schools = []
states = []
locations = []

# Create schools
school_names.each { |school|
  schools << School.create(
    name:school,
    email: "#{user_names.sample}@#{email_hosts.sample}.#{domains.sample}",
    ownership: ownership.sample,
    level: levels.sample,
    mode: modes.sample,
    gender: genders.sample,
    about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
    phone: 1234567
  )
}
