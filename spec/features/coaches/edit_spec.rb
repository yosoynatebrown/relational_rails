require "rails_helper"

RSpec.describe 'Coaches Update' do
  it 'links to edit page' do
    madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    visit "/coaches/#{madden.id}/edit"

    click_button "Update Coach"

    expect(current_path).to eq("/coaches/#{madden.id}/edit")
  end
end
