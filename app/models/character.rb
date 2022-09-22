class Character < ApplicationRecord
  has_many :char_skills, dependent: :destroy
  has_many :proficiencies, through: :char_skills
  belongs_to :user
  belongs_to :dnd_class
  belongs_to :race
end
