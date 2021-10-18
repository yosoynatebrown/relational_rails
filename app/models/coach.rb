class Coach < ApplicationRecord
 has_many :players, :dependent => :destroy

 def player_count
   self.players.count
 end

 def filter_by_career_total_points(point_cutoff)
   self.players.where("career_total_points > #{point_cutoff}")
 end 
end
