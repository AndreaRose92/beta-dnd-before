class DndClassSerializer < ActiveModel::Serializer
  attributes :id, :name, :url
  has_many :proficiencies
end
