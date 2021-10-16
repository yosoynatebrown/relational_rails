require "rails_helper"


RSpec.describe 'Players index' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)
    @dj = Player.create!(name: "Derek Jeter", MVP: true, career_total_points: 4000, coach: @madden)
    @tb = Player.create!(name: "Tom Brady", MVP: true, career_total_points: 6000, coach: @cooper)
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
end
