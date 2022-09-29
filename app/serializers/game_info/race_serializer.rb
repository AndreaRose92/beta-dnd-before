class RaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :size, :languages, :traits, :speed, :Strength, :Dexterity, :Constitution, :Intelligence, :Wisdom, :Charisma
  has_many :proficiencies
  has_many :subraces
  def attributes(*args)
    hash = super
    hash.each {|k,v|
      if v.nil?
        hash.delete(k)
      end
    }
    hash
  end
end
