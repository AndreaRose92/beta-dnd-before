class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hp, :current_hp
  belongs_to :user
  has_one :dnd_class
  has_one :race
  # has_many :proficiencies
end
