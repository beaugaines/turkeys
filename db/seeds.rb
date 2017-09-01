# User.create(
#   email: 'admin@turkeys.com',
#   password: 'password',
#   admin: true
# )

rr = Location.create!(address: "2400 I-35, Round Rock, TX 78681", name: "Rudy's Round Rock", tax_rate: 0.0825)
sixtwozero = Location.create!(address: "7709 Ranch Road 620 N, Austin, TX 78726", name: "Rudy's 620", tax_rate: 0.0825)
south = Location.create!(address: "2451 S Capital of Texas Hwy, Austin, TX 78746", name: "Rudy's South", tax_rate: 0.0825)
north = Location.create!(address: "11570 Research Blvd, Austin, TX 78759", name: "Rudy's North", tax_rate: 0.0825)

puts "#{Location.count} Locations created"

Item.create!([
  {name: "Turkey", price: 56.99},
  {name: "Turkey w/Sauce", price: 60.99},
])
