class Coach < ApplicationRecord
 has_many :players, :dependent => :destroy

 def player_count
   players.count
 end

 def filter_by_career_total_points(point_cutoff)
   players.where("career_total_points > #{point_cutoff}")
 end
end
