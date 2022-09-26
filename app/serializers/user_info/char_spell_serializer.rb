class CharSpellSerializer < ActiveModel::Serializer
  attributes :id
  has_one :character
  has_one :spell
end
