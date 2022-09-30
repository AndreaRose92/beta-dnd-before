class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest
  has_many :characters, only: [:name, :level, :race, :dnd_class]
end
