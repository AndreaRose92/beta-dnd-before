def url endpoint
    return "http://www.dnd5eapi.co/api/#{endpoint}"
end

puts 'seeding...'



# User.create(username: "AndreaRose", password: "420-password")

# class_response = RestClient.get("http://www.dnd5eapi.co/api/classes")
# dnd_classes = JSON.parse(class_response)["results"]
# dnd_classes.each { |dc|
#     DndClass.create(name: dc["name"], url: dc["url"])
# }

race_response = RestClient.get(url("races"))
races = JSON.parse(race_response)["results"]
races.each { |r| Race.create(name: r["name"], url: r["url"])}

puts 'done seeding...'