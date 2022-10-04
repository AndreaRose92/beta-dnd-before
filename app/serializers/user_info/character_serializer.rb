class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :level, :stats, :prof_bonus, :max_hp, :current_hp, :spellcasting_modifier
  # has_many :equipment
  # has_many :feats
  has_many :spells, serializer: SpellSerializer
  has_many :class_levels, serializer: DndClassLevelSerializer
  has_many :skills
  has_many :saves
  has_one :dnd_class
  has_one :race, serializer: CharacterRaceSerializer
  
  def stats
    [
      self.object.stat_data(:strength),
      self.object.stat_data(:dexterity),
      self.object.stat_data(:constitution),
      self.object.stat_data(:intelligence),
      self.object.stat_data(:wisdom),
      self.object.stat_data(:charisma)
    ]
  end
  
    def skills
      data = []
        Skill.all.filter{ |skill| !skill.name.include?('save') }.each {|skill|
        data << {
          name: skill.name,
          stat: skill.stat,
          is_proficient: self.object.is_proficient(skill.name),
          modifier: self.object.stat_modifier(self.object.race_bonus(skill.stat))
        }
        }
      data
    end
  
    def saves
      [
        {
          name: 'strength save',
          stat: 'strength',
          is_proficient: self.object.is_proficient('strength save'),
          modifier: self.stats[0][:modifier]
        },
        {
          name: 'dexterity save',
          stat: 'dexterity',
          is_proficient: self.object.is_proficient('dexterity save'),
          modifier: self.stats[1][:modifier]
        },
        {
          name: 'constitution save',
          stat: 'constitution',
          is_proficient: self.object.is_proficient('constitution save'),
          modifier: self.stats[2][:modifier]
        },
        {
          name: 'intelligence save',
          stat: 'intelligence',
          is_proficient: self.object.is_proficient('intelligence save'),
          modifier: self.stats[3][:modifier]
        },
        {
          name: 'wisdom save',
          stat: 'wisdom',
          is_proficient: self.object.is_proficient('wisdom save'),
          modifier: self.stats[4][:modifier]
        },
        {
          name: 'charisma save',
          stat: 'charisma',
          is_proficient: self.object.is_proficient('charisma save'),
          modifier: self.stats[5][:modifier]
        }
      ]
    end

  def prof_bonus
    self.object.class_levels.last.prof_bonus
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
