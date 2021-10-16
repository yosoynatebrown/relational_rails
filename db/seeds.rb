# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
@cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)

@willie = Player.create!(name: 'Willie Brown', MVP: false, career_total_points: 1000, coach: @madden)
@fred = Player.create!(name: 'Fred Biletnikoff', MVP: true, career_total_points: 3000, coach: @madden)
@mark = Player.create!(name: 'Mark van Eeghen', MVP: false, career_total_points: 1500, coach: @madden)
