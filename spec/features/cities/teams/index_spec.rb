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

  it 'has a header with links to other indexes' do
    visit "/coaches/"

    click_link('Coaches')
    expect(current_path).to eq("/coaches")

    expect(page.has_link? "Players").to be true
    expect(page.has_link? "Cities").to be true
    expect(page.has_link? "Teams").to be true
    expect(page.has_link? "Coaches").to be true
  end

  it 'has an add new team form' do
    visit "/cities/#{@slc.id}/teams"

    expect(page.has_link? "Add Team").to be true
  end

  it 'has a link to sort the teams in alphabetical order' do
    visit "/cities/#{@slc.id}/teams"

    expect(page.has_link? "Sort Alphabetically").to be true

    click_link "Sort Alphabetically"

    expect(page.text.index(@real.name)).to be < page.text.index(@jazz.name)
  end

  it 'has working delete team link' do
    visit "/cities/#{@sf.id}/teams"

    click_link("Delete #{@giants.name}")

    expect(current_path).to eq("/teams")
    expect(page).to_not have_content(@giants.name)
  end

  it 'has a link to an update form' do
    visit "/cities/#{@slc.id}/teams"
    # save_and_open_page
    click_link("Update #{@real.name}")
    expect(current_path).to eq("/teams/#{@real.id}/edit")

    visit "/cities/#{@slc.id}/teams"
    click_link("Update #{@jazz.name}")
    expect(current_path).to eq("/teams/#{@jazz.id}/edit")
  end

  it "can filter by roster count" do
    visit "/cities/#{@slc.id}/teams"

    fill_in "Roster Size >", with: "40"
    click_button("Submit")

    expect(page).to have_content("Real")
    expect(page).to_not have_content("Jazz")
  end
end
