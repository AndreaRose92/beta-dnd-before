class ClassSkillSerializer < ActiveModel::Serializer
  attributes :id
  has_one :dnd_class
  has_one :proficiency
end
