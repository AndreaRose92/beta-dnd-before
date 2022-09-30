class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :index
      t.string :weapon_category
      t.string :weapon_range
      t.integer :dSize
      t.integer :dAmt
      t.integer :modifier
      t.integer :normal_range
      t.integer :long_range
      t.string :damage_type
      t.string :properties
      t.string :desc

      t.timestamps
    end
  end
end
