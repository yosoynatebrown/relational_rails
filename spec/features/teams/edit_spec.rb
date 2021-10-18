require "rails_helper"

RSpec.describe 'Updates Team' do
    before :each do
      @slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
      @sf = City.create!(name: "San Francisco", above_4000_feet: false, population: 875_000)
      @giants = Team.create!(name: "San Francisco Giants", share_stadium: false, roster_count: 55, city: @sf)
      @jazz = Team.create!(name: "Utah Jazz", share_stadium: false, roster_count: 32, city: @slc)
    end

  it 'has the ability to update the current team' do
    visit "/teams/#{@giants.id}"

    click_link('Update Team')
    expect(current_path).to eq("/teams/#{@giants.id}/edit")


    fill_in("name", with: "New York Jets")
    check "share_stadium"
    fill_in("roster_count", with: "27")
    click_button "Update Team"

    expect(current_path).to eq("/teams/#{@giants.id}")
    expect(page).to have_content("New York Jets")
  end
end
