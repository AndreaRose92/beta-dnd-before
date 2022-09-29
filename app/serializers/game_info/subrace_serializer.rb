class SubraceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :languages, :traits, :Strength, :Dexterity, :Constitution, :Intelligence, :Wisdom, :Charisma

  def attributes(*args)
    hash = super
    hash.each { |k, v|
      if v.nil?
        hash.delete(k)
      end
    }
    hash
  end
end
