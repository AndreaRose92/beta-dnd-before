class SpellLevel < ApplicationRecord
  belongs_to :dnd_class

  attr_accessor :warlock_slot

  def calculate_warlock_slot
    if self.lvl_1 != 0
      self.warlock_slot = 1
    elsif self.lvl_2 != 0
      self.warlock_slot = 2
    elsif self.lvl_3 != 0
      self.warlock_slot = 3
    elsif self.lvl_4 != 0
      self.warlock_slot = 4
    elsif self.lvl_5 != 0
      self.warlock_slot = 5
    end
    self
  end
end
