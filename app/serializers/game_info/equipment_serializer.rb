class EquipmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :weapon_category, :weapon_range, :dSize, :dAmt, :damage_type, :properties
end
