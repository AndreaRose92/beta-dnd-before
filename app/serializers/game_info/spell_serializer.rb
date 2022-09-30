class SpellSerializer < ActiveModel::Serializer
  attributes :id, :name, :index, :level, :desc, :higher_level, :range, :duration, :casting_time, :dc, :ritual, :concentration, :slot_lvl_1_damage, :slot_lvl_2_damage, :slot_lvl_3_damage, :slot_lvl_4_damage, :slot_lvl_5_damage, :slot_lvl_6_damage, :slot_lvl_7_damage, :slot_lvl_8_damage, :slot_lvl_9_damage, :char_lvl_1_damage, :char_lvl_5_damage, :char_lvl_11_damage, :char_lvl_17_damage

  def attributes(*args)
    hash = super
    hash.each { |k, v|
      if v.nil?
        hash.delete(k)
      end
    }
    hash
  end
end
