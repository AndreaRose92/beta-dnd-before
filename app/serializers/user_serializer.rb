class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :characters
  
  def characters
    self.object.characters.pluck(:name)
  end

end
