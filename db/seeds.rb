# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
@cooper = Coach.create!(name: "Jon Cooper", won_championship: true, years_coaching: 7)

@willie = Player.create!(name: 'Willie Brown', MVP: false, career_total_points: 1000, coach: @madden)
@fred = Player.create!(name: 'Fred Biletnikoff', MVP: true, career_total_points: 3000, coach: @madden)
@mark = Player.create!(name: 'Mark van Eeghen', MVP: false, career_total_points: 1500, coach: @madden)

@blake = Player.create!(name: 'Blake Coleman', MVP: false, career_total_points: 50, coach: @cooper)
@andrei = Player.create!(name: 'Andrei Vasilevskiy', MVP: true, career_total_points: 75, coach: @cooper)
@nikita = Player.create!(name: 'Nikita Kucherov', MVP: true, career_total_points: 500, coach: @cooper)

@slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
@sf = City.create!(name: "San Francisco", above_4000_feet: false, population: 875_000)

@giants = Team.create!(name: "San Francisco Giants", share_stadium: false, roster_count: 55, city: @sf)
@niners = Team.create!(name: "San Francisco 49ers", share_stadium: false, roster_count: 40, city: @sf)
@jazz = Team.create!(name: "Utah Jazz", share_stadium: false, roster_count: 32, city: @slc)
@real = Team.create!(name: "Real Salt Lake", share_stadium: false, roster_count: 45, city: @slc)
@grizzlies = Team.create!(name: "Utah Grizzlies", share_stadium: true, roster_count: 32, city: @slc)
