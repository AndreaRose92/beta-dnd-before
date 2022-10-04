class Equipment < ApplicationRecord
    has_many :character_equips, dependent: :destroy
    has_many :class_equips, dependent: :destroy
    has_many :dnd_classes, through: :class_equips
end
