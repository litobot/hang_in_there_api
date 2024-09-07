require "rails_helper"

RSpec.describe "Sort Queries" do
  before(:each) do
    Poster.create!(
      name: "FAILURE",
      description: "Dreams don't work unless you do. And even then, they might not.",
      price: 75.00,
      year: 2019,
      vintage: false,
      img_url: "https://img.freepik.com/free-photo/black-white-image-sad-woman_23-2151338370.jpg",
      created_at: 10.seconds.ago
    )

    Poster.create!(
      name: "DISAPPOINTMENT",
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
  
  it "returns posters sorted by ASCENDING" do
    get "/api/v1/posters?sort=asc"

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)

    expect(posters[:data].count).to eq(3)

    # Didn't realize Orderly was allowed
    # Change to use Orderly
    expect(posters[:data][0][:attributes][:name]).to eq("REGRET")
    expect(posters[:data][1][:attributes][:name]).to eq("DISAPPOINTMENT")
    expect(posters[:data][2][:attributes][:name]).to eq("FAILURE")
  end

  it "returns posters sorted by DESCENDING" do
    get "/api/v1/posters?sort=desc"

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)

    expect(posters[:data].count).to eq(3)

    expect(posters[:data][2][:attributes][:name]).to eq("REGRET")
    expect(posters[:data][1][:attributes][:name]).to eq("DISAPPOINTMENT")
    expect(posters[:data][0][:attributes][:name]).to eq("FAILURE")
  end
end