$time_one = Time.now.utc.to_i
puts Time.now.utc.iso8601

puts 'wiping the guestbook...'

Character.destroy_all
User.destroy_all
User.reset_pk_sequence
Character.reset_pk_sequence

puts 'seeding users...'

User.create(username: "AndreaRose", password: "420-password")
User.create(username: "SamRose", password: "420-password")
User.create(username: "Aragorn", password: "420-password")
User.create(username: "Boromir", password: "420-password")
User.create(username: "Merry", password: "420-password")
User.create(username: "Pippin", password: "420-password")
User.create(username: "Frodo", password: "420-password")
User.create(username: "Samwise", password: "420-password")
User.create(username: "Gimli", password: "420-password")
User.create(username: "Legolas", password: "420-password")
User.create(username: "Gandalf", password: "420-password")