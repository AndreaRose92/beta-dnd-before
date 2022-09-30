class Feat < ApplicationRecord
    has_many :character_feats, dependent: :destroy
end
