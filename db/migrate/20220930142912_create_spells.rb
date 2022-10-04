class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :index
      t.integer :level
      t.string :desc
      t.string :higher_level
      t.string :range
      t.string :duration
      t.string :casting_time
      t.string :dc_type
      t.string :dc_success
      t.string :dc_desc
      t.boolean :ritual
      t.boolean :concentration
      t.string :damage_type
      t.string :slot_lvl_1_damage
      t.string :slot_lvl_2_damage
      t.string :slot_lvl_3_damage
      t.string :slot_lvl_4_damage
      t.string :slot_lvl_5_damage
      t.string :slot_lvl_6_damage
      t.string :slot_lvl_7_damage
      t.string :slot_lvl_8_damage
      t.string :slot_lvl_9_damage
      t.string :char_lvl_1_damage
      t.string :char_lvl_5_damage
      t.string :char_lvl_11_damage
      t.string :char_lvl_17_damage
      t.string :slot_lvl_1_heal
      t.string :slot_lvl_2_heal
      t.string :slot_lvl_3_heal
      t.string :slot_lvl_4_heal
      t.string :slot_lvl_5_heal
      t.string :slot_lvl_6_heal
      t.string :slot_lvl_7_heal
      t.string :slot_lvl_8_heal
      t.string :slot_lvl_9_heal

      t.timestamps
    end
  end
end
