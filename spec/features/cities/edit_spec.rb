require "rails_helper"

RSpec.describe 'Cities Update' do
  it 'links to edit page' do
    slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
    visit "/cities/#{slc.id}/edit"
    expect(current_path).to eq("/cities/#{slc.id}/edit")

    click_button "Update City"

    expect(current_path).to eq("/cities")
  end

  it 'has a working form' do
    slc = City.create!(name: "Salt Lakk Cit", above_4000_feet: true, population: 200_000)

    visit "/cities/#{slc.id}/edit"

    fill_in("name", with: "Salt Lake City")
    check "above_4000_feet"
    fill_in("population", with: "200_000")
    click_button "Update City"

    expect(current_path).to eq("/cities")
    expect(page).to have_content("Salt Lake City")
  end
end
