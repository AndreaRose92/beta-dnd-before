class BarbarianSerializer < ActiveModel::Serializer
  attributes :id, :level, :abi, :prof_bonus, :features, :class_specific
end
