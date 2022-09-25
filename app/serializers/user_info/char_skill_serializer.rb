class CharSkillSerializer < ActiveModel::Serializer
  attributes :id, :character
  has_one :proficiency

  def character
    self.object.character.name
  end
end
