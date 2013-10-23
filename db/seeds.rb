# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Issue.destroy_all

categories = []

10.times do
  categories << Category.create(
    name: Faker::Lorem.word
  )
end

20.times do
  Issue.create(
    name: Faker::Lorem.sentence,
    short_description: Faker::Lorem.paragraph,
    long_description: Faker::Lorem.paragraphs.join("\n"),
    smt_limit: rand(50) + 10,
    solvers_limit: rand(20) + 10,
    fake_smts: rand(10),
    fake_solvers: rand(10),
    category: categories.sample,
    published: true
  )
end
