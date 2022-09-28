class SpellDamageSerializer < ActiveModel::Serializer
  attributes :id, :slot_lvl_1, :slot_lvl_2, :slot_lvl_3, :slot_lvl_4, :slot_lvl_5, :slot_lvl_6, :slot_lvl_7, :slot_lvl_8, :slot_lvl_9, :char_lvl_1, :char_lvl_5, :char_lvl_11, :char_lvl_17
  has_one :spell
end
