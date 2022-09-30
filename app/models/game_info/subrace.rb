class Subrace < ApplicationRecord
  belongs_to :race
  has_many :subrace_traits, dependent: :destroy
  has_many :traits, through: :subrace_traits
end
