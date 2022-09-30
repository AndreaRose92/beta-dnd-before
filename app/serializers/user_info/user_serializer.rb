class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :characters, serializer: UserCharacterSerializer
end
