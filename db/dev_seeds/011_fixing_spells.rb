
Spell.all.each do |spell|
    spell_data = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/spells/#{spell.index}"))

    damage = spell_data["damage"] ? spell_data["damage"] : nil
    spell.update(damage_type:  damage && damage["damage_type"] ? damage["damage_type"]["name"] : nil)
end