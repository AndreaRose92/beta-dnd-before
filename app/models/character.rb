class Character < ApplicationRecord
  has_many :char_skills, dependent: :destroy
  has_many :proficiencies, through: :char_skills
  belongs_to :user
  belongs_to :dnd_class
  belongs_to :race

  def stat_modifier number
    modifier = ((number-10)/2).floor
    if modifier > 0
      "+#{modifier}"
    elsif modifier < 0
      "#{modifier}"
    else
      0
    end
  end

end
