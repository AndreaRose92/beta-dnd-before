class CreateBards < ActiveRecord::Migration[7.0]
  def change
    create_table :bards do |t|
      t.integer :level
      t.integer :abi
      t.integer :prof_bonus
      t.string :features
      t.string :class_specific
      t.string :spells

      t.timestamps
    end
  end
end
