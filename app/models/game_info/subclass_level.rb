class SubclassLevel < ApplicationRecord
  belongs_to :dnd_class_level
  belongs_to :subclass
end
