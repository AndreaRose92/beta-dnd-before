puts "seeding users..."

User.destroy_all
User.reset_pk_sequence

User.create!(username: "AndreaRose", password: "420-password")
User.create!(username: "SamRose", password: "420-password")
User.create!(username: "Aragorn", password: "420-password")
User.create!(username: "Boromir", password: "420-password")
User.create!(username: "Merry", password: "420-password")
User.create!(username: "Pippin", password: "420-password")
User.create!(username: "Frodo", password: "420-password")
User.create!(username: "Samwise", password: "420-password")
User.create!(username: "Gimli", password: "420-password")
User.create!(username: "Legolas", password: "420-password")
User.create!(username: "Gandalf", password: "420-password")
