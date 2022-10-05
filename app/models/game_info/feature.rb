class Feature < ApplicationRecord
  belongs_to :dnd_class
  belongs_to :dnd_class_level
  has_many :character_features, dependent: :destroy
end
