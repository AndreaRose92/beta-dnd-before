class RaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :index, :size, :languages, :speed, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
  has_many :skills, serializer: SkillSerializer
  has_many :traits, serializer: TraitSerializer
  has_many :subraces, serializer: SubraceSerializer
  # has_many :skills
  # has_many :traits
  # has_many :subraces
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
