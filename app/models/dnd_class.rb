class DndClass < ApplicationRecord
    has_many :class_skills, dependent: :destroy
    has_many :proficiencies, through: :class_skills
    has_many :barbarian_levels
    has_many :bard_levels
    has_many :cleric_levels
    has_many :druid_levels
    has_many :fighter_levels
    has_many :monk_levels
    has_many :paladin_levels
    has_many :ranger_levels
    has_many :rogue_levels
    has_many :sorcerer_levels
    has_many :warlock_levels
    has_many :wizard_levels

    def class_levels
        if self.name == "Barbarian"
            self.barbarian_levels
        elsif self.name == "Bard"
            self.bard_levels
        elsif self.name == "Cleric"
            self.cleric_levels
        elsif self.name == "Druid"
            self.druid_levels
        elsif self.name == "Fighter"
            self.fighter_levels
        elsif self.name == "Monk"
            self.monk_levels
        elsif self.name == "Paladin"
            self.paladin_levels
        elsif self.name == "Ranger"
            self.ranger_levels
        elsif self.name == "Rogue"
            self.rogue_levels
        elsif self.name == "Sorcerer"
            self.sorcerer_levels
        elsif self.name == "Warlock"
            self.warlock_levels
        elsif self.name == "Wizard"
            self.wizard_levels
        end
    end

end
