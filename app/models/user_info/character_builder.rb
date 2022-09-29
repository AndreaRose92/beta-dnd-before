class CharacterBuilder < ApplicationRecord

    belongs_to :dnd_class

    attr_accessor :available_spells, :spellcasting_level, :max_spell_level

end
