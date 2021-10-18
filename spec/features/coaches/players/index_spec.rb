require "rails_helper"

RSpec.describe 'Coaches players index' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)

    @mj = Player.create!(name: "Michael Jordan", MVP: true, career_total_points: 10000000, coach: @madden)
    @dj = Player.create!(name: "Derek Jeter", MVP: true, career_total_points: 4000, coach: @madden)
    @tb = Player.create!(name: "Tom Brady", MVP: true, career_total_points: 6000, coach: @cooper)
    @bp = Player.create!(name: "Brayden Point", MVP: false, career_total_points: 2400, coach: @cooper)
  end

  it 'shows all of the attributes of each coach\'s players' do
    visit "/coaches/#{@madden.id}/players"

    expect(page).to have_content(@mj.name)
    expect(page).to have_content(@mj.MVP)
    expect(page).to have_content(@mj.career_total_points)
    expect(page).to have_content(@mj.coach.name)

    expect(page).to have_content(@dj.name)
    expect(page).to have_content(@dj.MVP)
    expect(page).to have_content(@dj.career_total_points)
    expect(page).to have_content(@dj.coach.name)
  end

  it 'has a header with links to other indexes' do
    visit "/coaches/"

    click_link('Coaches')
    expect(current_path).to eq("/coaches")

    expect(page.has_link? "Players").to be true
    expect(page.has_link? "Cities").to be true
    expect(page.has_link? "Teams").to be true
    expect(page.has_link? "Coaches").to be true
  end

  it 'has an add new player form' do
    visit "/coaches/#{@madden.id}/players"

    expect(page.has_link? "Add Player").to be true
  end

  it 'has a working link to sort the players in alphabetical order' do
    visit "/coaches/#{@madden.id}/players"

    expect(page.has_link? "Sort Alphabetically").to be true

    click_link "Sort Alphabetically"

    expect(page.text.index(@dj.name)).to be < page.text.index(@mj.name)
  end

  it 'links to edit page' do

    visit "/coaches/#{@madden.id}/players/"

    expect(page.has_link? "Update #{@dj.name}").to be true
  end

  it 'can filter by career total points' do
    visit "/coaches/#{@madden.id}/players"

    fill_in "Career Total Points >", with: "5000"
    click_button("Only return records with more than stat for career total points")

    expect(page).to have_content("Michael Jordan")
    expect(page).to_not have_content("Derek Jeter")
  end
end
