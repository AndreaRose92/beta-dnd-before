class SubraceTrait < ApplicationRecord
  belongs_to :subrace
  belongs_to :trait

  validates :trait, uniqueness: {scope: :subrace}
end
