class DndClass < ApplicationRecord
    has_many :class_skills, dependent: :destroy
    has_many :proficiencies, through: :class_skills
    has_many :dnd_class_levels

end
