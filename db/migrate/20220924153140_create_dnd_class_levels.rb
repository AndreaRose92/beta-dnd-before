class CreateDndClassLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :dnd_class_levels do |t|
      t.belongs_to :dnd_class, null: false, foreign_key: true
      t.string :api_index
      t.string :features
      t.integer :level
      t.integer :ability_score_bonuses
      t.integer :prof_bonus
      t.integer :rage_count
      t.integer :rage_damage_bonus
      t.integer :brutal_critical_dice
      t.integer :bardic_inspiration_die
      t.integer :song_of_rest_die
      t.integer :magical_secrets_max_5
      t.integer :magical_secrets_max_7
      t.integer :magical_secrets_max_9
      t.integer :channel_divinity_charges
      t.integer :destroy_undead_cr
      t.integer :wild_shape_max_cr
      t.boolean :wild_shape_swim
      t.boolean :wild_shape_fly
      t.integer :action_surges
      t.integer :indomitable_uses
      t.integer :extra_attacks
      t.integer :martial_arts_dice_count
      t.integer :martial_arts_dice_value
      t.integer :ki_points
      t.integer :unarmored_movement
      t.integer :aura_range
      t.integer :favored_enemies
      t.integer :favored_terrain
      t.integer :sneak_attack_dice_count
      t.integer :sneak_attack_dice_value
      t.integer :sorcery_points
      t.integer :metamagic_known
      t.integer :create_lvl_1_slot
      t.integer :create_lvl_2_slot
      t.integer :create_lvl_3_slot
      t.integer :create_lvl_4_slot
      t.integer :create_lvl_5_slot
      t.integer :invocations_known
      t.integer :mystic_arcanum_level_6
      t.integer :mystic_arcanum_level_7
      t.integer :mystic_arcanum_level_8
      t.integer :mystic_arcanum_level_9
      t.integer :arcane_recovery_levels

      t.timestamps
    end
  end
end
