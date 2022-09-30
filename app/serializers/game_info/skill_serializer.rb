class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :stat, :desc, :index
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
