# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  addresses = [
    "485 Cheltenham Rd, Keysborough VIC 3173",
    "11 Nicholson St, Carlton VIC 3053",
    "Elliott Ave, Parkville VIC 3052",
    "41 Stewart St, Melbourne c/o Inspire9, Level1, Richmond VIC 3121",
    "328 Swanston St, Melbourne VIC 3000",
    "8 Whiteman St, Southbank VIC 3006",
    "79 John St, Cabramatta NSW 2166",
    "Tarlington Parade, Bonnyrigg NSW 2177",
    "120 Spencer St, Melbourne VIC 3004",
    "64 Toorak Rd, South Yarra VIC 3141",

    "14 Luisini Rd, Wangara WA 6065",
    " Level 1/395 Collins St, Melbourne VIC 3000",
    "42 Ferny Ave, Surfers Paradise QLD 4217",
    "99 Adelaide Terrace, Perth WA 6000",
    "1 Barrack St, Perth WA 6000",
    "815 Hay St, Perth WA 6000",
    "King William Rd, North Adelaide SA 5006",
    "45 King William St, Adelaide SA 5000",
    "Bennelong Point, Sydney NSW 2000",
    "1 Barangaroo Ave, Barangaroo NSW 2000"
  ]

puts "Cleaning database"
Car.destroy_all

puts "Creating cars"

20.times do
  car = Car.create(
    model: Faker::Vehicle.model,
    make: Faker::Vehicle.make,
    year: Faker::Vehicle.year,
    category: Faker::Vehicle.car_type,
    description: Faker::Vehicle.standard_specs,
    price: rand(20000..30000),
    availability: true,
    user_id: 1,
    transmission: Faker::Vehicle.drive_type,
    colour: Faker::Vehicle.color,
    address: addresses.sample
    # photo: Faker::LoremFlickr.unique.image
  )
  car.save
  puts "Car with model: #{car.model} has been created!"
end

puts "Finished!"
