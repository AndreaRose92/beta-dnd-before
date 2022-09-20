class CharSkillSerializer < ActiveModel::Serializer
  attributes :id
  has_one :character
  has_one :proficiency
end
