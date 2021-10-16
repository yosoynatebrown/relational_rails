require "rails_helper"


RSpec.describe 'Cities show' do
  before :each do
    @slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
    @sf = City.create!(name: "San Francisco", above_4000_feet: false, population: 875_000)

    @giants = Team.create!(name: "San Francisco Giants", share_stadium: false, roster_count: 55, city: @sf)
    @jazz = Team.create!(name: "Utah Jazz", share_stadium: false, roster_count: 32, city: @slc)
    @real = Team.create!(name: "Real Salt Lake", share_stadium: false, roster_count: 45, city: @slc)
  end
  it 'shows the name of all coaches' do
    visit "/cities/#{@slc.id}"
    expect(page).to have_content(@slc.name)
    expect(page).to have_content(@slc.above_4000_feet)
    expect(page).to have_content(@slc.population)

    expect(page).to_not have_content(@sf.name)

    visit "/cities/#{@sf.id}"

    expect(page).to have_content(@sf.name)
    expect(page).to have_content(@sf.above_4000_feet)
    expect(page).to have_content(@sf.population)

    expect(page).to_not have_content(@slc.name)
  end

  it 'shows the count of teams under a certain city' do
    visit "/cities/#{@slc.id}"

    expect(page).to have_content('Team Count: ' + @slc.team_count.to_s)
  end
end
