class CharacterSkill < ApplicationRecord
  belongs_to :character
  belongs_to :skill

  validates :skill, uniqueness: {scope: :character}
end
