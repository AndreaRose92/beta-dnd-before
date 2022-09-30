class UserCharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :image, :race, :dnd_class

  def race
    self.object.race.name
  end

  def dnd_class
    self.object.dnd_class.name
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
