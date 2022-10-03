require "./db/reference_data.rb"

Trait.destroy_all
Trait.reset_pk_sequence
Feature.destroy_all
Feature.reset_pk_sequence

all_traits = JSON.parse(RestClient.get("#{$api_url}/traits"))["results"]
all_features = JSON.parse(RestClient.get("#{$api_url}/features"))["results"]

puts "seeding traits...."

all_traits.each do |trait|
  trait_data = JSON.parse(RestClient.get("#{$api_url}/traits/#{trait["index"]}"))

  new_trait = Trait.create!(
    name: trait_data["name"],
    index: trait_data["index"],
    desc: trait_data["desc"][0],
  )

  if trait_data["races"]
    trait_data["races"].each do |race|
      RaceTrait.create!(
        trait: new_trait,
        race: Race.find_by(name: race["name"]),
      )
    end
  else
    trait_data["subraces"].each do |subrace|
      SubraceTrait.create!(
        trait: new_trait,
        subrace: Subrace.find_by(name: subrace["name"]),
      )
    end
  end
end

puts "seeding features..."

all_features.each do |feature|
  feature_data = JSON.parse(RestClient.get("#{$api_url}/features/#{feature["index"]}"))

  Feature.create!(
    name: feature_data["name"],
    index: feature_data["index"],
    desc: feature_data["desc"][0],
    level: feature_data["level"],
    dnd_class_id: DndClass.find_by(name: feature_data["class"]["name"]).id,
  )
end
