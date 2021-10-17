require "rails_helper"


RSpec.describe 'Players show' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)
    @dj = Player.create!(name: "Derek Jeter", MVP: true, career_total_points: 4000, coach: @madden)
    @tb = Player.create!(name: "Tom Brady", MVP: true, career_total_points: 6000, coach: @cooper)
  end
  it 'shows the name of all coaches' do
    visit "/players/#{@dj.id}"
    expect(page).to have_content(@dj.name)
    expect(page).to have_content(@dj.MVP)
    expect(page).to have_content(@dj.career_total_points)

    expect(page).to_not have_content(@tb.name)

    visit "/players/#{@tb.id}"
    expect(page).to have_content(@tb.name)
    expect(page).to have_content(@tb.MVP)
    expect(page).to have_content(@tb.career_total_points)

    expect(page).to_not have_content(@dj.name)
  end

  it 'has the ability to delete the current coach' do
    visit "/players/#{@tb.id}"

    click_link('Delete Player')

    expect(current_path).to eq("/players")
    expect(page).to_not have_content(@tb.name)
  end
end
