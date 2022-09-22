class DndClassSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :levels, :hit_die, :recommended_stat_one, :recommended_stat_two
  has_many :proficiencies
  
  def levels
    self.object.class_levels
  end

end
