require "rails_helper"

RSpec.describe 'Coaches players index' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)

    @dj = Player.create!(name: "Derek Jeter", MVP: true, career_total_points: 4000, coach: @madden)
    @tb = Player.create!(name: "Tom Brady", MVP: true, career_total_points: 6000, coach: @cooper)
    @bp = Player.create!(name: "Brayden Point", MVP: false, career_total_points: 2400, coach: @cooper)
    @mj = Player.create!(name: "Michael Jordan", MVP: true, career_total_points: 10000000, coach: @madden)
  end

  it 'can add new players' do
    visit "/coaches/#{@madden.id}/players/new"

    fill_in("name", with: "Lebron James")
    check "MVP"
    fill_in("career_total_points", with: "1000")
    click_button "Add Player"

    expect(current_path).to eq("/coaches/#{@madden.id}/players")
    expect(page).to have_content("Lebron James")
  end
end
