require "rails_helper"


RSpec.describe 'Cities new' do

  it 'index links to the new cities page' do
    visit "/cities/"

    click_link("New City")
    expect(current_path).to eq("/cities/new")
  end
  it 'has a working form' do
    visit "/cities/new"

    fill_in("name", with: "Charlotte")
    check "above_4000_feet"
    fill_in("population", with: "100")
    click_button "Create City"

    expect(current_path).to eq("/cities")
    expect(page).to have_content("Charlotte")
  end
end
