class EquipmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :index, :weapon_category, :weapon_range, :dSize, :dAmt, :modifier, :damage_type, :properties
  def attributes(*args)
    hash = super
    hash.each { |k, v|
      if v.nil?
        hash.delete(k)
      end
    }
    hash
  end
end
