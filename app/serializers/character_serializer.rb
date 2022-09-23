class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :hp, :current_hp, :stats, :skills
  belongs_to :user
  has_one :dnd_class
  has_one :race

  def skills
    self.object.proficiencies.pluck(:name)
  end

  def stats
    [
      {name: "Strength", value: self.object.Strength, modifier: self.object.stat_modifier(self.object.Strength)},
      {name: "Dexterity", value: self.object.Dexterity, modifier: self.object.stat_modifier(self.object.Dexterity)},
      {name: "Constitution", value: self.object.Constitution, modifier: self.object.stat_modifier(self.object.Constitution)},
      {name: "Intelligence", value: self.object.Intelligence, modifier: self.object.stat_modifier(self.object.Intelligence)},
      {name: "Wisdom", value: self.object.Wisdom, modifier: self.object.stat_modifier(self.object.Wisdom)},
      {name: "Charisma", value: self.object.Charisma, modifier: self.object.stat_modifier(self.object.Charisma)}
    ]
  end

end
