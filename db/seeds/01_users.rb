$time_one = Time.now.utc.to_i
puts Time.now.utc

puts 'wiping the guestbook...'

Character.destroy_all
User.destroy_all
User.reset_pk_sequence
Character.reset_pk_sequence

puts 'seeding users...'

User.create(username: "AndreaRose", password: "420-password")
User.create(username: "Samwise", password: "420-password")
