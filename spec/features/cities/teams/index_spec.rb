require "rails_helper"

RSpec.describe 'Cities teams index' do
  before :each do
    @slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
    @sf = City.create!(name: "San Francisco", above_4000_feet: false, population: 875_000)

    @giants = Team.create!(name: "San Francisco Giants", share_stadium: false, roster_count: 55, city: @sf)
    @jazz = Team.create!(name: "Utah Jazz", share_stadium: false, roster_count: 32, city: @slc)
    @real = Team.create!(name: "Real Salt Lake", share_stadium: false, roster_count: 45, city: @slc)
  end

  it 'shows all of the attributes of each city\'s teams'  do
    visit "/cities/#{@slc.id}/teams"

    expect(page).to have_content(@jazz.name)
    expect(page).to have_content(@jazz.share_stadium)
    expect(page).to have_content(@jazz.roster_count)
    expect(page).to have_content(@jazz.city.name)

    expect(page).to have_content(@real.name)
    expect(page).to have_content(@real.share_stadium)
    expect(page).to have_content(@real.roster_count)
    expect(page).to have_content(@real.city.name)
  end

  it 'has a link to sort the teams in alphabetical order' do
    visit "/cities/#{@slc.id}/teams"
    # save_and_open_page
    expect(page.has_link? "Sort Alphabetically").to be true

    click_link "Sort Alphabetically"

    expect(page.text.index(@real.name)).to be < page.text.index(@jazz.name)
  end
end
