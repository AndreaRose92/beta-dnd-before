class DndClassSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :hit_die, :recommended_stat_one, :recommended_stat_two
  has_many :proficiencies
  has_many :dnd_class_levels

end
