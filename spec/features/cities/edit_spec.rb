require "rails_helper"

RSpec.describe 'Cities Update' do
  it 'links to edit page' do
    slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
    visit "/cities/#{slc.id}/edit"
    expect(current_path).to eq("/cities/#{slc.id}/edit")

    click_button "Update City"

    expect(current_path).to eq("/cities")
  end
end
