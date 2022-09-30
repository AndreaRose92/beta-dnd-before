class DndClassLevel < ApplicationRecord
  require './db/reference_data.rb'
  belongs_to :dnd_class
  has_many :subclass_levels, dependent: :destroy

  # def feature_filter name, array
  #   case name
  #   when "Barbarian"
  #     new_array = array
  #   when "Bard"
  #     new_array = array.filter { |str| $bard_filters.any? { |feature| str.include?(feature) } }
  #   when "Cleric"
  #     new_array = array.filter { |str| $cleric_filters.any? { |feature| str.include?(feature) } }
  #   when "Druid"
  #     new_array = array.filter { |str| $druid_filters.any? { |feature| str.include?(feature) } }
  #   when "Fighter"
  #     new_array = array.filter { |str| $fighter_filters.any? { |feature| str.include?(feature) } }
  #   when "Monk"
  #     new_array = array.filter { |str| $monk_filters.any? { |feature| str.include?(feature) } }
  #   when "Paladin"
  #     new_array = array.filter { |str| $paladin_filters.any? { |feature| str.include?(feature) } }
  #   when "Ranger"
  #     new_array = array.filter { |str| $ranger_filters.any? { |feature| str.include?(feature) } }
  #   when "Rogue"
  #     new_array = array.filter { |str| $rogue_filters.any? { |feature| str.include?(feature) } }
  #   when "Sorcerer"
  #     new_array = array.filter { |str| $sorcerer_filters.any? { |feature| str.include?(feature) } }
  #   when "Warlock"
  #     new_array = array.filter { |str| $warlock_filters.any? { |feature| str.include?(feature) } }
  #   when "Wizard"
  #     new_array = array.filter { |str| $wizard_filters.any? { |feature| str.include?(feature) } }
  #   end
  #   new_array.size > 0 ? self.update(features: stringify_fetch(new_array)) : nil
  # end
end
