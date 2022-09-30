class RaceSkill < ApplicationRecord
  belongs_to :race
  belongs_to :skill

  validates :skill, uniqueness: {scope: :race}
end
