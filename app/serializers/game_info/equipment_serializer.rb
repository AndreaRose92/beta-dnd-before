class EquipmentSerializer < ActiveModel::Serializer
  attributes :name, :index, :weapon_category, :weapon_range,
   :normal_range, :long_range, :dSize, :dAmt, :modifier, :damage_type, :properties, :desc
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
