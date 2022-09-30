class CharacterEquip < ApplicationRecord
  belongs_to :character
  belongs_to :equipment
end
