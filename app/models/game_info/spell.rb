class Spell < ApplicationRecord
    has_many :class_spells, dependent: :destroy
    has_many :character_spells, dependent: :destroy
    has_many :classes, through: :class_spells


    def damage num
        if self["slot_lvl_#{num}_damage"]
            if self["slot_lvl_#{num}_damage"].include?("+")
                dmg = self["slot_lvl_#{num}_damage"].split("+")
                dAmt = dmg[0].split("d")[0]
                dSize = dmg[0].split("d")[1]
                mod = dmg[1]
            else
                dmg = self["slot_lvl_#{num}_damage"].split("d")
                dAmt = dmg[0]
                dSize = dmg[1]
                mod = nil
            end
        elsif self["char_lvl_#{num}_damage"]
            if self["char_lvl_#{num}_damage"].include?("+")
                dmg = self["char_lvl_#{num}_damage"].split("+")
                dAmt = dmg[0].split("d")[0]
                dSize = dmg[0].split("d")[1]
                mod = dmg[1]
            else
                dmg = self["char_lvl_#{num}_damage"].split("d")
                dAmt = dmg[0]
                dSize = dmg[1]
                mod = nil
            end
        elsif self["slot_lvl_#{num}_heal"]
            if self["slot_lvl_#{num}_heal"].include?("+")
                dmg = self["slot_lvl_#{num}_heal"].split("+")
                dAmt = dmg[0].split("d")[0]
                dSize = dmg[0].split("d")[1]
                mod = dmg[1]
            else
                dmg = self["slot_lvl_#{num}_heal"].split("d")
                dAmt = dmg[0]
                dSize = dmg[1]
                mod = nil
            end
        end
        return {
            level: num.to_i,
            dAmt: dAmt.to_i,
            dSize: dSize.to_i,
            mod: mod.to_i
        }
    end
end
