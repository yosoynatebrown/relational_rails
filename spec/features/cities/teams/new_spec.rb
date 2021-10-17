require "rails_helper"

RSpec.describe 'Cities team index' do
  before :each do
    @slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
    @sf = City.create!(name: "San Francisco", above_4000_feet: false, population: 875_000)

    @giants = Team.create!(name: "San Francisco Giants", share_stadium: false, roster_count: 55, city: @sf)
    @jazz = Team.create!(name: "Utah Jazz", share_stadium: false, roster_count: 32, city: @slc)
    @real = Team.create!(name: "Real Salt Lake", share_stadium: false, roster_count: 45, city: @slc)
  end

  it 'can add new teams' do
    visit "/cities/#{@slc.id}/teams/new"

    fill_in("name", with: "Utah Jazz")
    check "share_stadium"
    fill_in("roster_count", with: "32")
    click_button "Add Team"

    expect(current_path).to eq("/cities/#{@slc.id}/teams")
    expect(page).to have_content("Utah Jazz")
  end
end
