class FeatSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :prerequisites
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
