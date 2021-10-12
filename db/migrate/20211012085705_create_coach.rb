class CreateCoach < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :name
      t.boolean :won_championship
      t.integer :years_coaching

      t.timestamps
    end
  end
end
