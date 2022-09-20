class Character < ApplicationRecord
  belongs_to :user
  belongs_to :dnd_class
  belongs_to :race
end
