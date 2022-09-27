class Spell < ApplicationRecord
    has_many :char_spells
    has_many :class_spells
    has_one :spell_damage
end
