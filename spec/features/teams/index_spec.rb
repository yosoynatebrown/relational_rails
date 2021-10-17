require "rails_helper"


RSpec.describe 'Teams index' do
  before :each do
    @slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
    @sf = City.create!(name: "San Francisco", above_4000_feet: false, population: 875_000)
    @giants = Team.create!(name: "San Francisco Giants", share_stadium: true, roster_count: 55, city: @sf)
    @jazz = Team.create!(name: "Utah Jazz", share_stadium: true, roster_count: 32, city: @slc)
    @grizzlies = Team.create!(name: "Utah Grizzlies", share_stadium: false, roster_count: 32, city: @slc)
  end
  it 'shows the name of all teams' do
    visit "/teams/"

    expect(page).to have_content(@giants.name)
    expect(page).to have_content(@jazz.name)
    expect(page).to have_content(@slc.name)
    expect(page).to have_content(@sf.name)
    expect(page).to have_content(@giants.share_stadium)
    expect(page).to have_content(@giants.roster_count)
  end

  it 'only shows the name of teams who share their stadium' do
    visit "/teams/"

    expect(page).to have_content(@giants.name)
    expect(page).to have_content(@jazz.name)
    expect(page).to_not have_content(@grizzlies.name)
  end
end
