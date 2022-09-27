class CharSkill < ApplicationRecord
  belongs_to :character
  belongs_to :proficiency

  validates :proficiency, uniqueness: {scope: :character}
end
