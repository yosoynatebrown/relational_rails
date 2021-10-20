class Player < ApplicationRecord
  belongs_to :coach

  def mvp?
    self.MVP
  end

  def self.only_mvps
    where(MVP: true)
  end
end
