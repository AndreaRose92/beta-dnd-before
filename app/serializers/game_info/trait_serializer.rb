class TraitSerializer < ActiveModel::Serializer
  attributes :id, :index, :name, :desc
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
