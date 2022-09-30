class SubraceSerializer < ActiveModel::Serializer
  attributes :id, :name, :index, :languages, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
  has_many :traits, serializer: TraitSerializer
  # has_many :traits
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
