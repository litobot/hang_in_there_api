require "rails_helper"

RSpec.describe "Filtering query methods" do
  before(:each) do
    Poster.create!(
      name: "DISAStER",
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

  it "returns any posters containing case insensitive text in query" do
    
    get "/api/v1/posters"

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(posters.count).to eq(3)

    get "/api/v1/posters?name=ter"

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)[:data]
    
    expect(posters.count).to eq(2)

    expect(posters[0][:attributes][:name]).to eq("DISAStER")
    expect(posters[1][:attributes][:name]).to eq("TERRIBLE")
  end

  it "min price" do
    get "/api/v1/posters?min_price=75"
    
    expect(response).to be_successful
    posters = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(posters.count).to eq(2)

    poster_names = posters.map { |poster| poster[:attributes][:name] }
    expect(poster_names).to include("DISAStER", "REGRET")

    poster_prices = posters.map { |poster| poster[:attributes][:price] }
    poster_prices.each do |price|
      expect(price).to be >= 75.00
    end
  end

  it "max price" do
    get "/api/v1/posters?max_price=80"
    
    expect(response).to be_successful
    posters = JSON.parse(response.body, symbolize_names: true)[:data]
  
    expect(posters.count).to eq(2)
  
    poster_names = posters.map { |poster| poster[:attributes][:name] }
    expect(poster_names).to include("DISAStER", "TERRIBLE")
  
    poster_prices = posters.map { |poster| poster[:attributes][:price] }
    poster_prices.each do |price|
      expect(price).to be <= 80.00
    end
  end
end