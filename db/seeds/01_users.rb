puts 'wiping the guestbook...'

User.destroy_all
User.reset_pk_sequence

puts 'seeding users...'

User.create(username: "AndreaRose", password: "420-password")
User.create(username: "Samwise", password: "420-password")
