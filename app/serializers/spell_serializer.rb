class SpellSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :higher_level, :range, :ritual, :duration, :concentration, :level
end
