class SpellSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :higher_level, :range, :ritual, :duration, :concentration, :level
  has_one :spell_damage

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
