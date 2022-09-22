class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :hp, :current_hp, :stats
  belongs_to :user
  has_one :dnd_class
  has_one :race
  has_many :proficiencies
  def stats
    [["Str", self.object.strength],["Dex", self.object.dexterity],["Con", self.object.constitution],["Int", self.object.intelligence],["Wis", self.object.wisdom],["Cha", self.object.charisma]]
  end

end
