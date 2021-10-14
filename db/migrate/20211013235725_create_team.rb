class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :share_stadium
      t.integer :roster_count

      t.timestamps
    end
  end
end
