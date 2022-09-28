class SpellDamagesController < ApplicationController

    def show
        damage = SpellDamage.find_by(spell: find_spell)
        if damage
            render json: damage
        else
            push_data = {
                spell: find_spell,
                damage_type: fetch_data["damage_type"]["name"]
            }
            if slot_damage
                push_data[:slot_lvl_1] = slot_damage["1"] ? slot_damage["1"] : nil
                push_data[:slot_lvl_2] = slot_damage["2"] ? slot_damage["2"] : nil
                push_data[:slot_lvl_3] = slot_damage["3"] ? slot_damage["3"] : nil
                push_data[:slot_lvl_4] = slot_damage["4"] ? slot_damage["4"] : nil
                push_data[:slot_lvl_5] = slot_damage["5"] ? slot_damage["5"] : nil
                push_data[:slot_lvl_6] = slot_damage["6"] ? slot_damage["6"] : nil
                push_data[:slot_lvl_7] = slot_damage["7"] ? slot_damage["7"] : nil
                push_data[:slot_lvl_8] = slot_damage["8"] ? slot_damage["8"] : nil
                push_data[:slot_lvl_9] = slot_damage["9"] ? slot_damage["9"] : nil
            elsif char_damage
                push_data[:char_lvl_1] = char_damage["1"] ? char_damage["1"] : nil,
                push_data[:char_lvl_5] = char_damage["5"] ? char_damage["5"] : nil,
                push_data[:char_lvl_11] = char_damage["11"] ? char_damage["11"] : nil,
                push_data[:char_lvl_17] = char_damage["17"] ? char_damage["17"] : nil
            end
            render json: push_data
        end
    end

    def create
        damage = SpellDamage.find_or_create_by(spell: find_spell) do |damage|
            damage.damage_type = fetch_data["damage_type"]["name"]
            if slot_damage
                damage.slot_lvl_1 = slot_damage["1"] ? slot_damage["1"] : nil
                damage.slot_lvl_2 = slot_damage["2"] ? slot_damage["2"] : nil
                damage.slot_lvl_3 = slot_damage["3"] ? slot_damage["3"] : nil
                damage.slot_lvl_4 = slot_damage["4"] ? slot_damage["4"] : nil
                damage.slot_lvl_5 = slot_damage["5"] ? slot_damage["5"] : nil
                damage.slot_lvl_6 = slot_damage["6"] ? slot_damage["6"] : nil
                damage.slot_lvl_7 = slot_damage["7"] ? slot_damage["7"] : nil
                damage.slot_lvl_8 = slot_damage["8"] ? slot_damage["8"] : nil
                damage.slot_lvl_9 = slot_damage["9"] ? slot_damage["9"] : nil
            elsif char_damage
                damage.char_lvl_1 = char_damage["1"] ? char_damage["1"] : nil
                damage.char_lvl_5 = char_damage["5"] ? char_damage["5"] : nil
                damage.char_lvl_11 = char_damage["11"] ? char_damage["11"] : nil
                damage.char_lvl_17 = char_damage["17"] ? char_damage["17"] : nil
            end
        end
        render json: damage, status: :created
    end

    private

    def find_spell
        Spell.find_by(api_index: params[:spell])
    end

    def fetch_data
        response = RestClient.get("http://www.dnd5eapi.co/api/spells/#{params[:spell]}")
        data = JSON.parse(response)["damage"]
        data
    end

    def slot_damage
        return fetch_data["damage_at_slot_level"]
    end

    def char_damage
        return fetch_data["damage_at_char_level"]
    end

end
