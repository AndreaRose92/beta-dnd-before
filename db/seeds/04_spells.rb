puts 'burying arcane secrets...'

Spell.destroy_all
Spell.reset_pk_sequence

puts 'discovering lost knowledge...'

spells_response = RestClient.get("http://www.dnd5eapi.co/api/spells")
spells_list = JSON.parse(spells_response)["results"]
spells_list.each do |spell| 
    spell_response = RestClient.get("https://www.dnd5eapi.co#{spell["url"]}")
    spell = JSON.parse(spell_response)
    Spell.create(
        name: spell["name"],
        desc: spell["desc"][0],
        higher_level: spell["higher_level"],
        range: spell["range"],
        ritual: spell["ritual"],
        duration: spell["duration"],
        concentration: spell["concentration"],
        level: spell["level"]
    )
end