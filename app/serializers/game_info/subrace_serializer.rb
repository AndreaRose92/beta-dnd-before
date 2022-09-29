class SubraceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :languages, :traits, :Strength, :Dexterity, :Constitution, :Intelligence, :Wisdom, :Charisma
end
