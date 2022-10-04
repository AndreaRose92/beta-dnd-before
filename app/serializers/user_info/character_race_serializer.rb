class CharacterRaceSerializer < ActiveModel::Serializer
  attributes :name, :index, :size, :languages, :speed, :traits

  def traits
    data = self.object.traits.pluck(:name)
    self.object.subraces.each { |subrace| data << subrace.traits.pluck(:name)}
    data.flatten.join(', ')
  end

end
