require "rails_helper"

RSpec.describe 'Updates Players' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)
    @dj = Player.create!(name: "Derek Jeter", MVP: true, career_total_points: 4000, coach: @madden)
    @tb = Player.create!(name: "Tom Brady", MVP: true, career_total_points: 6000, coach: @cooper)
  end

  it 'has the ability to update the current player' do
    visit "/players/#{@dj.id}"

    click_link('Update Player')
    expect(current_path).to eq("/players/#{@dj.id}/edit")


    fill_in("name", with: "Yani Gourde")
    check "MVP"
    fill_in("career_total_points", with: "200")
    click_button "Update Player"

    expect(current_path).to eq("/players/#{@dj.id}")
    expect(page).to have_content("Yani Gourde")
  end
end
