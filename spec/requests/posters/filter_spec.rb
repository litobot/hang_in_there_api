require "rails_helper"

RSpec.describe "Filtering query methods" do
  before(:each) do
    Poster.create!(
      name: "DISASTER",
      description: "Dreams don't work unless you do. And even then, they might not.",
      price: 75.00,
      year: 2019,
      vintage: false,
      img_url: "https://img.freepik.com/free-photo/black-white-image-sad-woman_23-2151338370.jpg",
      created_at: 10.seconds.ago
    )

    Poster.create!(
      name: "TERRIBLE",
      description: "Expect the worst, and you'll never be disappointed.",
      price: 60.00,
      year: 2020,
      vintage: false,
      img_url: "https://as1.ftcdn.net/v2/jpg/02/32/41/30/1000_F_232413095_8eEpb7R3iCfJjS8acs7u6U3Wkt2YPxoO.jpg",
      created_at: 20.seconds.ago

    )

    Poster.create!(
      name: "REGRET",
      description: "Hard work rarely pays off.",
      price: 89.00,
      year: 2018,
      vintage: true,
      img_url: "https://www.myclickmagazine.com/wp-content/uploads/2016/06/black-and-white-landscape-photograph-by-Jennifer-Green.jpg",
      created_at: 30.seconds.ago

    )
  end

# Must be returned in case-insensitive alphabetical order
# Returns poster objects whose names contain a query string ("ter")
  # => would return poster objects with names "DISASTER" & "TERRIBLE"


  it "returns any posters containing case insensitive text in query" do
    
    get "/api/v1/posters"

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(posters.count).to eq(3)

    get "/api/v1/posters?name=ter"

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)[:data]
    
    expect(posters.count).to eq(2)
   
    expect(posters[0][:attribute][:name]).to eq("DISASTER")
    expect(posters[1][:attribute][:name]).to eq("TERRIBLE")
    expect("DISASTER").to appear_before("TERRIBLE")
  end
end