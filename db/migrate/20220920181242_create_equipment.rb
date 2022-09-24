class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :weapon_type
      t.integer :dSize
      t.integer :dAmt
      t.string :damage_type
      t.string :properties

      t.timestamps
    end
  end
end
