class DndClassLevelSerializer < ActiveModel::Serializer
  attributes :id, :level, :ability_score_bonuses, :prof_bonus, :features, :class_specific, :spells
  has_one :dnd_class
end
