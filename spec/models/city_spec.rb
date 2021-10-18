require "rails_helper"

RSpec.describe "City model" do
  before(:each) do
    @slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)

    @jazz = Team.create!(name: "Utah Jazz", share_stadium: false, roster_count: 32, city: @slc)
    @real = Team.create!(name: "Real Salt Lake", share_stadium: false, roster_count: 45, city: @slc)
  end

  it 'counts the number of players a city has' do
    expect(@slc.team_count).to eq(2)
  end

  it 'can filter teams by their roster count' do
    expect(@slc.filter_by_roster_count(40)[0].name).to eq("Real Salt Lake")
  end
end
