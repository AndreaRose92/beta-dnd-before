class SpellSerializer < ActiveModel::Serializer
  attributes :name, :index, :level, :desc, :higher_level, :range, :duration, :casting_time, :dc_type, :dc_success, :dc_desc, :ritual, :concentration, :damage_type, :damage

  def damage
    damage = [
      self.object.damage(1),
      self.object.damage(2),
      self.object.damage(3),
      self.object.damage(4),
      self.object.damage(5),
      self.object.damage(6),
      self.object.damage(7),
      self.object.damage(8),
      self.object.damage(9)
    ].filter{|level| level[:dSize] != 0 }
    damage.empty? ? nil : damage
  end

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
