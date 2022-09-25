class RaceSkillSerializer < ActiveModel::Serializer
  attributes :id
  has_one :race
  has_one :proficiency
end
