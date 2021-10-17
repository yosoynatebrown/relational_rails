require "rails_helper"

RSpec.describe 'Coaches Update' do
  it 'links to edit page' do
    madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    visit "/coaches/#{madden.id}/edit"
    expect(current_path).to eq("/coaches/#{madden.id}/edit")

    click_button "Update Coach"

    expect(current_path).to eq("/coaches")
  end

  it 'has a working form' do
    madden = Coach.create!(name: "John 'Maddog' Madden", won_championship: true, years_coaching: 18)

    visit "/coaches/#{madden.id}/edit"

    fill_in("name", with: "John Madden")
    check "won_championship"
    fill_in("years_coaching", with: "18")
    click_button "Update Coach"

    expect(current_path).to eq("/coaches")
    expect(page).to have_content("John Madden")
  end
end
