# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times.each do |n|
  user = User.create!(name: "test#{n + 1}", email: "test#{n + 1}@test.com", password: "password")
  (1..100).each do |number|
    user.tasks.create!(status: 'not_yet', content: 'test' + number.to_s )
  end
end

