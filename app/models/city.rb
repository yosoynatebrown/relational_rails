class City < ApplicationRecord
  has_many :teams, :dependent => :destroy

  def team_count
    teams.count
  end

  def filter_by_roster_count(roster_cutoff)
    teams.where("roster_count > #{roster_cutoff}")
  end

  def self.order_by_created_at
    order(created_at: :desc)
  end
end
