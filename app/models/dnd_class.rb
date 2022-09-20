class DndClass < ApplicationRecord
    has_many :class_skills, dependent: :destroy
    has_many :proficiencies, through: :class_skills
end
