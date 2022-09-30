class FeatureSerializer < ActiveModel::Serializer
  attributes :id, :name, :index, :desc, :level
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
