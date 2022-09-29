class DndClassSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :hit_die, :recommended_stat_one, :recommended_stat_two
  has_many :dnd_class_levels
  has_many :proficiencies

  def attributes(*args)
    hash = super
    hash.each { |k, v|
      if v.nil?
        hash.delete(k)
      end
    }
    hash
  end

  # has_many :spell_levels

  # def spell_levels
  #   case self.object.name
  #   when "Bard"
  #     spells = SpellLevel.where(dnd_class: DndClass.find_by(name: "Bard"))
  #   when "Cleric"
  #     spells = SpellLevel.where(dnd_class: DndClass.find_by(name: "Cleric"))
  #   when "Druid"
  #     spells = SpellLevel.where(dnd_class: DndClass.find_by(name: "Druid"))
  #   when "Paladin"
  #     spells = SpellLevel.where(dnd_class: DndClass.find_by(name: "Paladin"))
  #   when "Ranger"
  #     spells = SpellLevel.where(dnd_class: DndClass.find_by(name: "Ranger"))
  #   when "Sorcerer"
  #     spells = SpellLevel.where(dnd_class: DndClass.find_by(name: "Sorcerer"))
  #   when "Warlock"
  #     spells = SpellLevel.where(dnd_class: DndClass.find_by(name: "Warlock"))
  #     spells = spells.map { |spell| spell.calculate_warlock_slot }
  #     spells
  #   when "Wizard"
  #     spells = SpellLevel.where(dnd_class: DndClass.find_by(name: "Wizard"))
  #   when "Barbarian" || "Fighter" || "Monk" || "Rogue"
  #     spells = nil
  #   end
  #   spells
  # end
end
