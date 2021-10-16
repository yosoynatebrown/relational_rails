require "rails_helper"


RSpec.describe 'Coaches show' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)

    @willie = Player.create!(name: 'Willie Brown', MVP: false, career_total_points: 1000, coach: @madden)
    @fred = Player.create!(name: 'Fred Biletnikoff', MVP: true, career_total_points: 3000, coach: @madden)
    @mark = Player.create!(name: 'Mark van Eeghen', MVP: false, career_total_points: 1500, coach: @madden)
  end
  it 'shows the name of all coaches' do
    visit "/coaches/#{@madden.id}"
    expect(page).to have_content(@madden.name)
    expect(page).to have_content(@madden.won_championship)
    expect(page).to have_content(@madden.years_coaching)

    expect(page).to_not have_content(@cooper.name)

    visit "/coaches/#{@cooper.id}"

    expect(page).to have_content(@cooper.name)
    expect(page).to have_content(@cooper.won_championship)
    expect(page).to have_content(@cooper.years_coaching)

    expect(page).to_not have_content(@madden.name)
  end

  it 'shows the count of players under a certain coach' do
    visit "/coaches/#{@madden.id}"

    expect(page).to have_content('Player Count: ' + @madden.player_count.to_s)
  end

  it 'has a link to child index' do
    visit "/coaches/#{@madden.id}"

    click_link('Coach\'s Players')
    expect(current_path).to eq("/coaches/#{@madden.id}/players")
  end
end
