require "rails_helper"


RSpec.describe 'Coaches index' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)

  end
  it 'shows the name of all coaches' do
    visit "/coaches/"

    expect(page).to have_content(@madden.name)
    expect(page).to have_content(@cooper.name)
  end
end
