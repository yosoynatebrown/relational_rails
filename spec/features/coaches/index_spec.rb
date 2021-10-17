require "rails_helper"


RSpec.describe 'Coaches index' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    sleep(1)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)
    visit "/coaches/"
  end
  it 'shows the name of all coaches' do

    expect(page).to have_content(@madden.name)
    expect(page).to have_content(@cooper.name)
  end

  it 'displays the time created of all coaches in the correct order' do

    expect(page).to have_content(@madden.created_at)
    expect(page).to have_content(@cooper.created_at)
    expect(page.text.index(@madden.name)).to be > page.text.index(@cooper.name)
  end

  it 'links to the new coach page' do
    click_link("New Coach")

    expect(current_path).to eq("/coaches/new")
  end

  it 'links to the edit coach page' do
    click_link("Edit #{@madden.name}")

    expect(current_path).to eq("/coaches/#{@madden.id}/edit")
  end

  it 'has delete coach link' do
    visit "/coaches/"

    click_link("Delete #{@madden.name}")

    expect(current_path).to eq("/coaches")
    expect(page).to_not have_content(@madden.name)
  end

end
