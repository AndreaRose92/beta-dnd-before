class Trait < ApplicationRecord
    has_many :race_traits, dependent: :destroy
    has_many :races, through: :race_traits
    has_many :subrace_traits
    has_many :subraces, through: :subrace_traits
end
