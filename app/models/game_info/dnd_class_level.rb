class DndClassLevel < ApplicationRecord
  belongs_to :dnd_class
  has_many :features, dependent: :destroy
  has_many :subclass_levels, dependent: :destroy

end
