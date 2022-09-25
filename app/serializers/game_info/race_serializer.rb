class RaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :ability_score_bonuses, :size, :languages, :traits, :speed
  has_many :proficiencies
  has_many :subraces
end
