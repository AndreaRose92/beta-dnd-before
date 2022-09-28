class CharacterBuilderSerializer < ActiveModel::Serializer
  attributes :id, :spellcasting_level, :available_spells
  has_one :dnd_class
  has_one :race

  def spellcasting_level
    self.object.dnd_class.dnd_class_levels.find_by(level: self.object.level).spell_level
  end

  def available_spells
    self.object.dnd_class.spells.where('level < ?', self.object.level)
  end

end
