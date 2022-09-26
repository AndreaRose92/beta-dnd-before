class RaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :size, :languages, :traits, :speed, :Strength, :Dexterity, :Constitution, :Intelligence, :Wisdom, :Charisma
  has_many :proficiencies
  has_many :subraces
end
