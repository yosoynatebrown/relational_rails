require "rails_helper"

RSpec.describe 'Updates Coach\'s Players' do
  it 'links to edit page' do
    madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    dj = Player.create!(name: "Derek Jeter", MVP: true, career_total_points: 4000, coach: @madden)

    visit "/coaches/#{madden.id}/players/#{dj.id}/edit"
    expect(current_path).to eq("/coaches/#{madden.id}/players/#{dj.id}edit")

    click_button "Update Player"

    expect(current_path).to eq("/coaches/players")
  end

  it 'has a working form' do
    madden = Coach.create!(name: "John 'Maddog' Madden", won_championship: true, years_coaching: 18)
    dj = Player.create!(name: "Derek Jeter", MVP: true, career_total_points: 4000, coach: @madden)

    visit "/coaches/#{madden.id}/players/#{dj.id}/edit"

    fill_in("name", with: "Allen Iverson")
    check "MVP"
    fill_in("career_total_points", with: "2200")
    click_button "Update Player"

    expect(current_path).to eq("/coaches/players")
    expect(page).to have_content("Allen Iverson")
  end
end
