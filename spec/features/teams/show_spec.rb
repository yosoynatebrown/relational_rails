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

  it 'has a header with links to other indexes' do
    visit "/cities/"

    click_link('Cities')
    expect(current_path).to eq("/cities")

    expect(page.has_link? "Players").to be true
    expect(page.has_link? "Cities").to be true
    expect(page.has_link? "Teams").to be true
    expect(page.has_link? "Coaches").to be true
  end

  it 'has the ability to delete the current team' do
    visit "/teams/#{@giants.id}"

    click_link('Delete Team')

    expect(current_path).to eq("/teams")
    expect(page).to_not have_content(@giants.name)
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
