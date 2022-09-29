DndClass.destroy_all
DndClass.reset_pk_sequence
Race.destroy_all
Race.reset_pk_sequence

dnd_classes = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/classes"))["results"]
dnd_classes.each do |dc| DndClass.create(name: dc["name"], url: dc["url"]) end
races = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/races"))["results"]
races.each do |dc| Race.create(name: dc["name"], url: dc["url"]) end