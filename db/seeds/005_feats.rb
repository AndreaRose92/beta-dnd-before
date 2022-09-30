require "json"

Feat.destroy_all
Feat.reset_pk_sequence

puts "finding your specialty..."

file = File.read("./feats.json")
feats = JSON.parse(file)
feats.each { |feat|
  Feat.create(
    name: feat["Feat"],
    desc: feat["Description"],
    prerequisites: feat["Prerequisites"],
  )
}
