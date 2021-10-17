require "rails_helper"


RSpec.describe 'Players index' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)
    @dj = Player.create!(name: "Derek Jeter", MVP: true, career_total_points: 4000, coach: @madden)
    @tb = Player.create!(name: "Tom Brady", MVP: true, career_total_points: 6000, coach: @cooper)
    @mark = Player.create!(name: 'Mark van Eeghen', MVP: false, career_total_points: 1500, coach: @madden)

  end
  it 'shows the name of all players' do
    visit "/players/"

    expect(page).to have_content(@dj.name)
    expect(page).to have_content(@tb.name)
    expect(page).to have_content(@madden.name)
    expect(page).to have_content(@cooper.name)
    expect(page).to have_content(@tb.MVP)
    expect(page).to have_content(@tb.career_total_points)
  end

  it 'has a header with links to other indexes' do
    visit "/cities/"

    click_link('Teams')
    expect(current_path).to eq("/teams")

    expect(page.has_link? "Players").to be true
    expect(page.has_link? "Cities").to be true
    expect(page.has_link? "Teams").to be true
    expect(page.has_link? "Coaches").to be true
  end

  it 'only shows the name of players who are MVPs' do
    visit "/players/"

    expect(page).to have_content(@dj.name)
    expect(page).to have_content(@tb.name)
    expect(page).to_not have_content(@mark.name)
  end


    it 'has working delete player link' do
      visit "/players/"

      click_link("Delete #{@dj.name}")

      expect(current_path).to eq("/players")
      expect(page).to_not have_content(@dj.name)
    end

end
