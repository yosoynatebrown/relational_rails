class City < ApplicationRecord
  has_many :teams

  def team_count
    self.teams.count
  end
end
