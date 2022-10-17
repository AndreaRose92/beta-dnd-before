class DndClassSerializer < ActiveModel::Serializer
  require "./db/reference_data.rb"
  attributes :id, :name, :index, :hit_die, :recommended_stat_one, :recommended_stat_two
  has_many :skills, serializer: SkillSerializer
  has_many :dnd_class_levels, serializer: DndClassLevelSerializer
  has_many :subclasses, serializer: SubclassSerializer
  # has_many :filtered_features, serializer: FeatureSerializer
  has_many :filtered_features
  # has_many :skills
  # has_many :dnd_class_levels
  # has_many :subclasses

  def filtered_features
    case self.object.name
    when "Barbarian"
      features = self.object.features
    when "Bard"
      features = self.object.features.filter { |elem| $bard_filters.none? { |v| (elem.name.include?(v)) } }
    when "Cleric"
      features = self.object.features.filter { |elem| $cleric_filters.none? { |v| (elem.name.include?(v)) } }
    when "Druid"
      features = self.object.features.filter { |elem| $druid_filters.none? { |v| (elem.name.include?(v)) } }
    when "Fighter"
      features = self.object.features.filter { |elem| $fighter_filters.none? { |v| (elem.name.include?(v)) } }
    when "Monk"
      features = self.object.features.filter { |elem| $monk_filters.none? { |v| (elem.name.include?(v)) } }
    when "Paladin"
      features = self.object.features.filter { |elem| $paladin_filters.none? { |v| (elem.name.include?(v)) } }
    when "Ranger"
      features = self.object.features.filter { |elem| $ranger_filters.none? { |v| (elem.name.include?(v)) } }
    when "Rogue"
      features = self.object.features.filter { |elem| $rogue_filters.none? { |v| (elem.name.include?(v)) } }
    when "Sorcerer"
      features = self.object.features.filter { |elem| $sorcerer_filters.none? { |v| (elem.name.include?(v)) } }
    when "Warlock"
      features = self.object.features.filter { |elem| $warlock_filters.none? { |v| (elem.name.include?(v)) } }
    when "Wizard"
      features = self.object.features.filter { |elem| $wizard_filters.none? { |v| (elem.name.include?(v)) } }
    end
    features
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
