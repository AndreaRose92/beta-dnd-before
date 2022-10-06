class DndClassSerializer < ActiveModel::Serializer
  attributes :id, :name, :index, :hit_die, :recommended_stat_one, :recommended_stat_two
  has_many :skills, serializer: SkillSerializer
  has_many :dnd_class_levels, serializer: DndClassLevelSerializer
  has_many :subclasses, serializer: SubclassSerializer
  # has_many :features, serializer: FeatureSerializer
  has_many :features
  # has_many :skills
  # has_many :dnd_class_levels
  # has_many :subclasses

  def features
    self.object.features.pluck(:name)
  end


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
