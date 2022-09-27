class FeatSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :prerequisites
end
