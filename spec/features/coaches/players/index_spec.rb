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

  it 'shows all of the attributes of each coach\'s players' do
    visit "/coaches/#{@madden.id}/players"
    save_and_open_page
    expect(page).to have_content(@mj.name)
    expect(page).to have_content(@mj.MVP)
    expect(page).to have_content(@mj.career_total_points)
    expect(page).to have_content(@mj.coach.name)
  end
end
