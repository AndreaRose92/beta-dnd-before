class ClassSpell < ApplicationRecord
  belongs_to :dnd_class
  belongs_to :spell

  validates :spell, uniqueness: {scope: :dnd_class}
end
