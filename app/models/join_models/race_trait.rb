class RaceTrait < ApplicationRecord
  belongs_to :race
  belongs_to :trait

  validates :trait, uniqueness: {scope: :race}
end
