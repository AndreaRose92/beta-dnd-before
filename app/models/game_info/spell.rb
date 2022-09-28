class Spell < ApplicationRecord
    has_many :char_spells, dependent: :destroy
    has_many :class_spells, dependent: :destroy
    has_one :spell_damage, dependent: :destroy
end
