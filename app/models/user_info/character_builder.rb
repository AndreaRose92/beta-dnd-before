class CharacterBuilder < ApplicationRecord

    belongs_to :dnd_class
    belongs_to :race

    attr_accessor :available_spells, :spellcasting_level

end
