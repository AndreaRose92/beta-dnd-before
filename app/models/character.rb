class Character < ApplicationRecord
  has_many :char_skills, dependent: :destroy
  belongs_to :user
  belongs_to :dnd_class
  belongs_to :race
end
