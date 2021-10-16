require "rails_helper"


RSpec.describe 'Coaches new' do

  it 'index links to the new coach page' do
    visit "/coaches/"

    click_link("New Coach")
    expect(current_path).to eq("/coaches/new")
  end
  it 'has a working form' do
    visit "/coaches/new"

    fill_in("name", with: "Christian Valesares")
    check "won_championship"
    fill_in("years_coaching", with: "100")
    click_button "Create Coach"

    expect(current_path).to eq("/coaches")
    expect(page).to have_content("Christian Valesares")
  end
end
