class SpellsController < ApplicationController

    def create
        spell = Spell.find_or_create_by(index: params[:spell]) do |spell|
            spell.name = spell_data["name"]
            spell.desc = spell_data["desc"].join(' ')
            spell.higher_level = higher_level
            spell.range = spell_data["range"]
            spell.ritual = spell_data["ritual"]
            spell.concentration = spell_data["concentration"]
            spell.duration = spell_data["duration"]
            spell.level = spell_data["level"]
            spell.casting_time = spell_data["casting_time"]
            spell.dc_type = dc_type
            spell.dc_success = dc_success
            spell.dc_desc = dc_desc
            spell.damage_type = damage_type
            spell.slot_lvl_1_damage = slot_damage && slot_damage["1"] ? slot_damage["1"] : nil
            spell.slot_lvl_2_damage = slot_damage && slot_damage["2"] ? slot_damage["2"] : nil
            spell.slot_lvl_3_damage = slot_damage && slot_damage["3"] ? slot_damage["3"] : nil
            spell.slot_lvl_4_damage = slot_damage && slot_damage["4"] ? slot_damage["4"] : nil
            spell.slot_lvl_5_damage = slot_damage && slot_damage["5"] ? slot_damage["5"] : nil
            spell.slot_lvl_6_damage = slot_damage && slot_damage["6"] ? slot_damage["6"] : nil
            spell.slot_lvl_7_damage = slot_damage && slot_damage["7"] ? slot_damage["7"] : nil
            spell.slot_lvl_8_damage = slot_damage && slot_damage["8"] ? slot_damage["8"] : nil
            spell.slot_lvl_9_damage = slot_damage && slot_damage["9"] ? slot_damage["9"] : nil
            spell.char_lvl_1_damage = character_damage ? character_damage["1"] : nil
            spell.char_lvl_5_damage = character_damage ? character_damage["5"] : nil
            spell.char_lvl_11_damage = character_damage ? character_damage["11"] : nil
            spell.char_lvl_17_damage = character_damage ? character_damage["17"] : nil
            spell.slot_lvl_1_heal = heal && heal["1"] ? heal["1"] : nil
            spell.slot_lvl_2_heal = heal && heal["2"] ? heal["2"] : nil
            spell.slot_lvl_3_heal = heal && heal["3"] ? heal["3"] : nil
            spell.slot_lvl_4_heal = heal && heal["4"] ? heal["4"] : nil
            spell.slot_lvl_5_heal = heal && heal["5"] ? heal["5"] : nil
            spell.slot_lvl_6_heal = heal && heal["6"] ? heal["6"] : nil
            spell.slot_lvl_7_heal = heal && heal["7"] ? heal["7"] : nil
            spell.slot_lvl_8_heal = heal && heal["8"] ? heal["8"] : nil
            spell.slot_lvl_9_heal = heal && heal["9"] ? heal["9"] : nil
        end
        render json: spell, status: :created
    end

    private

    def spell_data
        JSON.parse(RestClient.get("#{api_url}/spells/#{params[:spell]}"))
    end

    def damage
        spell_data["damage"] ? spell_data["damage"] : nil
    end

    def slot_damage
        damage && damage["damage_at_slot_level"] ? damage["damage_at_slot_level"] : nil
    end

    def character_damage
        damage && damage["damage_character_level"] ? damage["damage_character_level"] : nil
    end

    def damage_type
        damage && damage["damage_type"] ? damage["damage_type"]["name"] : nil
        spell_data["heal_at_slot_level"] ? "Healing" : nil
    end

    def higher_level
        spell_data["higher_level"][0] ? spell_data["higher_level"].join(' ')
    end

    def heal
        spell_data["heal_at_slot_level"] ? spell_data["heal_at_slot_level"] : nil
    end

    def dc_type
        spell_data["dc"] ? parse_stat(spell_data["dc"]["dc_type"]["name"]) : nil
    end

    def dc_success
        spell_data["dc"] ? spell_data["dc"]["dc_success"]
    end

    def dc_desc
        spell_data["dc"]["desc"] ? spell_data["dc"]["desc"] : nil
    end
end
