class DndClass < ApplicationRecord
    has_many :dnd_class_levels, dependent: :destroy
    has_many :subclasses, dependent: :destroy
    has_many :class_skills, dependent: :destroy
    has_many :class_spells, dependent: :destroy
    has_many :class_equips, dependent: :destroy
    has_many :features, dependent: :destroy
    has_many :characters, dependent: :destroy
    has_many :subclass_levels, through: :subclasses, dependent: :destroy
    has_many :skills, through: :class_skills
    has_many :spells, through: :class_spells
    has_many :equipment, through: :class_equips

    attr_accessor :spellcasting_level, :available_spells

end
