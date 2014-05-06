namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "Example",
                 middle_initial: "K",
                 last_name: "User",
                 email: "hereit@is.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    25.times do |n|
      fname  = Faker::Name.name
      minit  = Faker::Name.name
      lname  = Faker::Name.name
      email = "example-#{n+1}@hawaii.edu"
      password  = "password"
      User.create!(first_name: fname,
                   middle_inital: minit,
                   last_name: lname,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end