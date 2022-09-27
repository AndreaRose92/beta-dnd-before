class DndClassLevel < ApplicationRecord
  belongs_to :dnd_class
  has_one :spell_level
end
