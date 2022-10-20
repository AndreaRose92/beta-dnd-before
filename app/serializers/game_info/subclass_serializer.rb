class SubclassSerializer < ActiveModel::Serializer
  attributes :id, :index, :name, :flavor, :desc
  has_one :dnd_class
  has_many :subclass_levels, serializer: SubclassLevelSerializer
  has_many :features
  # has_many :subclass_levels
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
