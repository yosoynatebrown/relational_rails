class AddCoachToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :coach, foreign_key: true
  end
end
