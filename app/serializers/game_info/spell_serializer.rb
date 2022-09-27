class SpellSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :higher_level, :range, :ritual, :duration, :concentration, :level
  has_one :spell_damage
end
