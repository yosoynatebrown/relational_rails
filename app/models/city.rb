class City < ApplicationRecord
  has_many :teams, :dependent => :destroy

  def team_count
    self.teams.count
  end

  def filter_by_roster_count(roster_cutoff)
    self.teams.where("roster_count > #{roster_cutoff}")
  end
end
