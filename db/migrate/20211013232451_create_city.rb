class CreateCity < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.boolean :above_4000_feet
      t.integer :population

      t.timestamps
    end
  end
end
