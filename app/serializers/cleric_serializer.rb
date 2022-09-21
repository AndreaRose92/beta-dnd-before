class ClericSerializer < ActiveModel::Serializer
  attributes :id, :level, :abi, :prof_bonus, :features, :class_specific, :spells
end
