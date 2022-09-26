class CreateSpellLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :spell_levels do |t|
      t.belongs_to :dnd_class, null: false, foreign_key: true
      t.integer :cantrips_known
      t.integer :spells_known
      t.integer :lvl_1
      t.integer :lvl_2
      t.integer :lvl_3
      t.integer :lvl_4
      t.integer :lvl_5
      t.integer :lvl_6
      t.integer :lvl_7
      t.integer :lvl_8
      t.integer :lvl_9

      t.timestamps
    end
  end
end
