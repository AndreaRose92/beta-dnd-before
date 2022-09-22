class DruidSerializer < ActiveModel::Serializer
  attributes :id, :level, :ability_score_bonuses, :prof_bonus, :features, :class_specific, :spells
end
