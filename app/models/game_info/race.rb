class Race < ApplicationRecord
    has_many :race_skills, dependent: :destroy
    has_many :proficiencies, through: :race_skills
    has_many :subraces, dependent: :destroy
    has_many :character_builders
end
