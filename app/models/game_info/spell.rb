class Spell < ApplicationRecord
    has_many :class_spells, dependent: :destroy
    has_many :char_spells, dependent: :destroy
    has_many :classes, through: :class_spells
end
