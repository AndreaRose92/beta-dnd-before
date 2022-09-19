puts 'seeding...'

User.create(username: "AndreaRose", password: "420-password")

response = RestClient.get("http://www.dnd5eapi.co/api/classes")
dnd_classes = JSON.parse(response)["results"]
dnd_classes.each { |dc|
    DndClass.create(name: dc["name"], url: dc["url"])
}

puts 'done seeding...'