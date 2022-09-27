class SpellDamageSerializer < ActiveModel::Serializer
  attributes :id, :slot_lvl_1, :slot_lvl_2, :slot_lvl_3, :slot_lvl_4, :slot_lvl_5, :slot_lvl_6, :slot_lvl_7, :slot_lvl_8, :slot_lvl_9, :char_lvl_1, :char_lvl_2, :char_lvl_3, :char_lvl_4, :char_lvl_5, :char_lvl_6, :char_lvl_7, :char_lvl_8, :char_lvl_9, :char_lvl_10, :char_lvl_11, :char_lvl_12, :char_lvl_13, :char_lvl_14, :char_lvl_15, :char_lvl_16, :char_lvl_17, :char_lvl_18, :char_lvl_19, :char_lvl_20
  has_one :spell
end
