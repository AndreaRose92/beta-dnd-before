class CharacterSpell < ApplicationRecord
  belongs_to :character
  belongs_to :spell

  validates :spell, uniqueness: {scope: :character}
end
