class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hp, :current_hp
  has_one :user
  has_one :dnd_class
  has_one :race
end
