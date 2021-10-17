require "rails_helper"


RSpec.describe 'Cities index' do
  before :each do
    @slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
    @sf = City.create!(name: "San Francisco", above_4000_feet: false, population: 875_000)
  end
  it 'shows the name of all cities' do
    visit "/cities/"

    expect(page).to have_content(@slc.name)
    expect(page).to have_content(@sf.name)
  end

  it 'displays the time created of all cities in the correct order' do
    visit "/cities/"

    expect(page).to have_content(@slc.created_at)
    expect(page).to have_content(@sf.created_at)
    expect(page.text.index(@slc.name)).to be > page.text.index(@sf.name)
  end

  it 'has a header with links to other indexes' do
    visit "/cities/"

    click_link('Players')
    expect(current_path).to eq("/players")

    expect(page.has_link? "Players").to be true
    expect(page.has_link? "Cities").to be true
    expect(page.has_link? "Teams").to be true
    expect(page.has_link? "Coaches").to be true
  end

  it 'links to the new city page' do
    visit "/cities/"

    click_link("New City")

    expect(current_path).to eq("/cities/new")
  end
end
