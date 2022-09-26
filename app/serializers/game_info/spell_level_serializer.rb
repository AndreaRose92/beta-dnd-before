class SpellLevelSerializer < ActiveModel::Serializer
  attributes :cantrips_known, :spells_known, :lvl_1, :lvl_2, :lvl_3, :lvl_4, :lvl_5, :lvl_6, :lvl_7, :lvl_8, :lvl_9, :warlock_slot
  has_one :dnd_class
end
