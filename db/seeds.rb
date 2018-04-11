# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'base62'

(1..100).each do |count|
  link = Link.create(
    long: Faker::Internet.url,
    visits: rand(0..120)
  )
  link.short = link.id.base62_encode
  link.save
end
