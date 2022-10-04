class Spell < ApplicationRecord
    has_many :class_spells, dependent: :destroy
    has_many :character_spells, dependent: :destroy
    has_many :classes, through: :class_spells
end
