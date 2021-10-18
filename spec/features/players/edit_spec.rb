require "rails_helper"

RSpec.describe 'Updates Players' do
  it 'has a working form' do
    madden = Coach.create!(name: "John 'Maddog' Madden", won_championship: true, years_coaching: 18)
    dj = Player.create!(name: "Derek Jeter", MVP: true, career_total_points: 4000, coach: madden)

    visit "/coaches/#{madden.id}/players/"

    click_link "Update #{dj.name}"

    fill_in("name", with: "Allen Iverson")
    check "MVP"
    fill_in("career_total_points", with: "2200")

    click_link "Update Player"

    expect(current_path).to eq("/players/#{dj.id}")
    expect(page).to have_content("Allen Iverson")
    expect(page).to have_content("4000")
  end
end
