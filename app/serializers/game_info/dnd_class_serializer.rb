class DndClassSerializer < ActiveModel::Serializer
  require "./db/reference_data.rb"
  attributes :id, :name, :index, :hit_die, :recommended_stat_one, :recommended_stat_two
  has_many :features
  has_many :skills, serializer: SkillSerializer
  has_many :dnd_class_levels
  has_many :subclasses, serializer: SubclassSerializer

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
