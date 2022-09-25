class UserCharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :dnd_class, :race

  def dnd_class
    self.object.dnd_class.name
  end
  def race
    self.object.race.name
  end

end
