require "rails_helper"


RSpec.describe 'Cities index' do
  before :each do
    @slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
    @sf = City.create!(name: "San Francisco", above_4000_feet: false, population: 875_000)
  end
  it 'shows the name of all coaches' do
    visit "/cities/"

    expect(page).to have_content(@slc.name)
    expect(page).to have_content(@sf.name)
  end
end
