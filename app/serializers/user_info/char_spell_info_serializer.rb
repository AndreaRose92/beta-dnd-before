class CharSpellInfoSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :casting_time, :higher_level, :range, :ritual, :duration, :concentration, :level, :damage_type, :damage_at_char_level, :damage_at_slot_level

  def damage_type
    spell = self.object.spell_damage ? self.object.spell_damage : nil
    return spell ? spell.damage_type : nil
  end

  def damage_at_char_level
    spell = self.object.spell_damage ? self.object.spell_damage : nil
    damage = spell ? [{lvl_1: spell.char_lvl_1}, {lvl_5: spell.char_lvl_5}, {lvl_11: spell.char_lvl_11}, {lvl_17: spell.char_lvl_17}] : nil
    if self.object.level == 0 
      return damage
    else
      return nil
    end
  end

  def damage_at_slot_level
    spell = self.object.spell_damage ? self.object.spell_damage : nil
    damage = spell ? [{lvl_1: spell.slot_lvl_1}, {lvl_2: spell.slot_lvl_2}, {lvl_3: spell.slot_lvl_3}, {lvl_4: spell.slot_lvl_4}, {lvl_5: spell.slot_lvl_5}, {lvl_6: spell.slot_lvl_6}, {lvl_7: spell.slot_lvl_7}, {lvl_8: spell.slot_lvl_8}, {lvl_9: spell.slot_lvl_9}] : nil
    if self.object.level != 0
      return damage
    else
      return nil
    end
  end

end
