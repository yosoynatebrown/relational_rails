require "rails_helper"


RSpec.describe 'Coaches show' do
  before :each do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    @cooper = Coach.create!(name: "John Cooper", won_championship: true, years_coaching: 7)

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
end
