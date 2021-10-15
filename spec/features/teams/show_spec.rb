require "rails_helper"


RSpec.describe 'Teams show' do
  before :each do
    @slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
    @sf = City.create!(name: "San Francisco", above_4000_feet: false, population: 875_000)
    @giants = Team.create!(name: "San Francisco Giants", share_stadium: false, roster_count: 55, city: @sf)
    @jazz = Team.create!(name: "Utah Jazz", share_stadium: false, roster_count: 32, city: @slc)
  end
  it 'shows the attributes of individual teams' do
    visit "/teams/#{@giants.id}"
    expect(page).to have_content(@giants.name)
    expect(page).to have_content(@giants.share_stadium)
    expect(page).to have_content(@giants.roster_count)

    expect(page).to_not have_content(@jazz.name)

    visit "/teams/#{@jazz.id}"
    expect(page).to have_content(@jazz.name)
    expect(page).to have_content(@jazz.share_stadium)
    expect(page).to have_content(@jazz.roster_count)

    expect(page).to_not have_content(@giants.name)
  end
end
