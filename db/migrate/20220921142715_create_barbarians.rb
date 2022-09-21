class CreateBarbarians < ActiveRecord::Migration[7.0]
  def change
    create_table :barbarians do |t|
      t.integer :level
      t.integer :ability_score_bonuses
      t.integer :prof_bonus
      t.string :features
      t.string :class_specific
      t.string :spells

      t.timestamps
    end
  end
end
