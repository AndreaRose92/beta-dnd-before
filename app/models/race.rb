class Race < ApplicationRecord
    has_many :race_skills, dependent: :destroy
    has_many :proficiencies, through: :race_skills
end
