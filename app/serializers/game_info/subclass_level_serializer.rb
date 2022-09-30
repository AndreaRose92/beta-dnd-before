class SubclassLevelSerializer < ActiveModel::Serializer
  attributes :id, :subclass_specific, :features
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
