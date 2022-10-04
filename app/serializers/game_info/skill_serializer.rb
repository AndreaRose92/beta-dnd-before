class SkillSerializer < ActiveModel::Serializer
  attributes :name, :stat, :desc, :index, :is_save
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
