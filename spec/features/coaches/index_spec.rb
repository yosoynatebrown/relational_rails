require "rails_helper"


RSpec.describe 'Coaches index' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    sleep(1)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)

  end
  it 'shows the name of all coaches' do
    visit "/coaches/"

    expect(page).to have_content(@madden.name)
    expect(page).to have_content(@cooper.name)
  end

  it 'displays the time created of all coaches in the correct order' do
    visit "/coaches/"

    expect(page).to have_content(@madden.created_at)
    expect(page).to have_content(@cooper.created_at)
    expect(page.text.index(@madden.name)).to be > page.text.index(@cooper.name)
  end

end
