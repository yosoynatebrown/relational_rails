class AddCitytoTeams < ActiveRecord::Migration[5.2]
  def change
    add_reference :teams, :city, foreign_key: true
  end
end
