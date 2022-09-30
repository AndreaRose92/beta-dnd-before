class CharacterFeat < ApplicationRecord
  belongs_to :character
  belongs_to :feat

  validates :feat, uniqueness: {scope: :character}
end
