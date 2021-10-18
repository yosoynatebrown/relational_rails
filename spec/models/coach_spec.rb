require "rails_helper"

RSpec.describe "Coach model" do
  before(:each) do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)

    @willie = Player.create!(name: 'Willie Brown', MVP: false, career_total_points: 1000, coach: @madden)
    @fred = Player.create!(name: 'Fred Biletnikoff', MVP: true, career_total_points: 3000, coach: @madden)
    @mark = Player.create!(name: 'Mark van Eeghen', MVP: false, career_total_points: 1500, coach: @madden)
  end

  it 'counts the number of players a coach has' do
    expect(@madden.player_count).to eq(3)
  end

  it 'can filter players by their career total points' do
    expect(@madden.filter_by_career_total_points(2000)[0].name).to eq("Fred Biletnikoff")
  end
end
