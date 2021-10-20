class Team < ApplicationRecord
  belongs_to :city

  def share_stadium?
    self.share_stadium
  end

  def self.only_share_stadiums
    where(share_stadium: true)
  end
end
