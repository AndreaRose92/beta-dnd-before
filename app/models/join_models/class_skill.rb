class ClassSkill < ApplicationRecord
  belongs_to :dnd_class
  belongs_to :skill

  validates :skill, uniqueness: {scope: :dnd_class}
end
