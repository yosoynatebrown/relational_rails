class City < ApplicationRecord
  has_many :teams, :dependent => :destroy

  def team_count
    self.teams.count
  end
end
