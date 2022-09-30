class Race < ApplicationRecord
    has_many :race_skills, dependent: :destroy
    has_many :race_traits, dependent: :destroy
    has_many :subraces, dependent: :destroy
    has_many :characters, dependent: :destroy
    has_many :skills, through: :race_skills
    has_many :traits, through: :race_traits
end
