# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



Poster.delete_all

Poster.create(
  name: "FAILURE",
  description: "Dreams don't work unless you do. And even then, they might not.",
  price: 75.00,
  year: 2019,
  vintage: false,
  img_url: "https://img.freepik.com/free-photo/black-white-image-sad-woman_23-2151338370.jpg"
)

Poster.create(
  name: "DISAPPOINTMENT",
  description: "Expect the worst, and you'll never be disappointed.",
  price: 60.00,
  year: 2020,
  vintage: false,
  img_url: "https://as1.ftcdn.net/v2/jpg/02/32/41/30/1000_F_232413095_8eEpb7R3iCfJjS8acs7u6U3Wkt2YPxoO.jpg"
)

Poster.create(
  name: "REGRET",
  description: "Hard work rarely pays off.",
  price: 89.00,
  year: 2018,
  vintage: true,
  img_url: "https://www.myclickmagazine.com/wp-content/uploads/2016/06/black-and-white-landscape-photograph-by-Jennifer-Green.jpg"
)

Poster.create(
  name: "DESPAIR",
  description: "The light at the end of the tunnel might be an oncoming train.",
  price: 70.00,
  year: 2017,
  vintage: true,
  img_url: "https://i.pinimg.com/736x/66/cc/cb/66cccbf49897ad18d05661f3dfe7d846.jpg"
)

Poster.create(
  name: "FUTILITY",
  description: "Just because you’re unique doesn’t mean you’re useful.",
  price: 80.00,
  year: 2016,
  vintage: true,
  img_url: "https://www.nplusonemag.com/wp-content/uploads/2014/04/toumani.jpg"
)

Poster.create(
  name: "INEVITABILITY",
  description: "No matter how fast you run, time catches up with you.",
  price: 85.00,
  year: 2021,
  vintage: false,
  img_url: "https://www.comicsands.com/media-library/black-and-white-photo-an-elderly-woman-is-wiping-her-tears-with-a-tissue.jpg?id=52284732&width=1245&height=700&quality=85&coordinates=0%2C100%2C0%2C100"
)

Poster.create(
  name: "POINTLESS",
  description: "Why try when failure is always an option?",
  price: 78.00,
  year: 2022,
  vintage: false,
  img_url: "https://www.christiancentury.org/sites/default/files/styles/wide_stacked/public/images/detail/hand_on_shoulder_caring_presence_sad_grief.jpg?itok=isPMCjcL"
)

Poster.create(
  name: "DOUBT",
  description: "Believe in yourself... unless you can’t, then just give up.",
  price: 65.00,
  year: 2019,
  vintage: false,
  img_url: "https://qph.cf2.quoracdn.net/main-qimg-16194589917c31f80786fc2f1bdee986-pjlq"
)

Poster.create(
  name: "MISERY",
  description: "Misery loves company, but sometimes even company can’t stand it.",
  price: 90.00,
  year: 2015,
  vintage: true,
  img_url: "https://thumbs.dreamstime.com/b/sad-dog-black-white-25558531.jpg"
)

Poster.create(
  name: "HOPELESSNESS",
  description: "Hope is the first step on the road to disappointment.",
  price: 88.00,
  year: 2020,
  vintage: false,
  img_url: "https://keithdotson.com/cdn/shop/products/DSC05097_Broken_Ghost_Town_Window_40_x_60_1024x1024.jpg?v=1575931859"
)