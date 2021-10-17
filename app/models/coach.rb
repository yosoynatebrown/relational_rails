class Coach < ApplicationRecord
 has_many :players, :dependent => :destroy

 def player_count
   self.players.count
 end
end
