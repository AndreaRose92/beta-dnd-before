class CharacterClassSerializer < ActiveModel::Serializer
  attributes :name, :hit_die
  has_many :subclasses, serializer: SubclassSerializer
  has_many :features, serializer: FeatureSerializer
end
