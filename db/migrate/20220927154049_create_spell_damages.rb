class CreateSpellDamages < ActiveRecord::Migration[7.0]
  def change
    create_table :spell_damages do |t|
      t.belongs_to :spell, null: false, foreign_key: true
      t.string :damage_type
      t.string :slot_lvl_1
      t.string :slot_lvl_2
      t.string :slot_lvl_3
      t.string :slot_lvl_4
      t.string :slot_lvl_5
      t.string :slot_lvl_6
      t.string :slot_lvl_7
      t.string :slot_lvl_8
      t.string :slot_lvl_9
      t.string :char_lvl_1
      t.string :char_lvl_5
      t.string :char_lvl_11
      t.string :char_lvl_17

      t.timestamps
    end
  end
end
