class Equipment < ApplicationRecord
    has_many :character_equips, dependent: :destroy
end
