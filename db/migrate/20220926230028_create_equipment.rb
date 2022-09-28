class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :api_index
      t.string :url
      t.string :weapon_category
      t.string :weapon_range
      t.integer :dSize
      t.integer :dAmt
      t.string :damage_type
      t.string :properties

      t.timestamps
    end
  end
end
