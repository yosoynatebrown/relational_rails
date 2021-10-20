require "rails_helper"

RSpec.describe Player do
  describe 'relationship' do
    it { should belong_to :coach }
  end
  before(:each) do
    @madden = Coach.create!(name: "John Madden", won_championship: true, years_coaching: 18)
    @cooper = Coach.create!(name: "Jon Cooper", won_championship: true, years_coaching: 7)

    @willie = Player.create!(name: 'Willie Brown', MVP: true, career_total_points: 1000, coach: @madden)
    @fred = Player.create!(name: 'Fred Biletnikoff', MVP: true, career_total_points: 3000, coach: @madden)
    @mark = Player.create!(name: 'Mark van Eeghen', MVP: false, career_total_points: 1500, coach: @madden)
  end

  it '#mvp?' do
    expect(@willie.mvp?).to be true
    expect(@fred.mvp?).to be true
    expect(@mark.mvp?).to be false
  end

  it 'can provide list of players who are MVPs' do
    expect(Player.only_mvps).to include(@willie)
    expect(Player.only_mvps).to include(@fred)
    expect(Player.only_mvps).to_not include(@mark)
  end


end
