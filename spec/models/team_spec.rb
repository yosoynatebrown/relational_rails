require "rails_helper"

RSpec.describe Team do
  describe 'relationship' do
    it { should belong_to :city }
  end
  before(:each) do
    @slc = City.create!(name: "Salt Lake City", above_4000_feet: true, population: 200_000)
    @sf = City.create!(name: "San Francisco", above_4000_feet: false, population: 875_000)
    @giants = Team.create!(name: "San Francisco Giants", share_stadium: true, roster_count: 55, city: @sf)
    @jazz = Team.create!(name: "Utah Jazz", share_stadium: true, roster_count: 32, city: @slc)
    @grizzlies = Team.create!(name: "Utah Grizzlies", share_stadium: false, roster_count: 32, city: @slc)
  end

  it '#share_stadium?' do
    expect(@giants.share_stadium?).to be true
    expect(@jazz.share_stadium?).to be true
    expect(@grizzlies.share_stadium?).to be false
  end

  it 'can provide list of teams who share their stadium' do
    expect(Team.only_share_stadiums).to include(@giants)
    expect(Team.only_share_stadiums).to include(@jazz)
  end
end
