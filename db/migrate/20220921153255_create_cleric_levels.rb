class CreateClericLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :clerics do |t|
      t.belongs_to :dnd_class, null: false, foreign_key: true
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
