class SubraceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :ability_score_bonuses, :languages, :traits
end
