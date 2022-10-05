class FeatureSerializer < ActiveModel::Serializer
  attributes :name, :index, :desc, :level

  def level
    self.object.dnd_class_level.level
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
