class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.boolean :MVP
      t.integer :career_total_points

      t.timestamps
    end
  end
end
