require "rails_helper"

RSpec.describe "Posters Endpoints" do
  describe "GET request actions" do
    before(:each) do
      Poster.create!(
        name: "FAILURE",
        description: "Dreams don't work unless you do. And even then, they might not.",
        price: 75.00,
        year: 2019,
        vintage: false,
        img_url: "https://img.freepik.com/free-photo/black-white-image-sad-woman_23-2151338370.jpg"
      )

      Poster.create!(
        name: "DISAPPOINTMENT",
        description: "Expect the worst, and you'll never be disappointed.",
        price: 60.00,
        year: 2020,
        vintage: false,
        img_url: "https://as1.ftcdn.net/v2/jpg/02/32/41/30/1000_F_232413095_8eEpb7R3iCfJjS8acs7u6U3Wkt2YPxoO.jpg"
      )

      Poster.create!(
        name: "REGRET",
        description: "Hard work rarely pays off.",
        price: 89.00,
        year: 2018,
        vintage: true,
        img_url: "https://www.myclickmagazine.com/wp-content/uploads/2016/06/black-and-white-landscape-photograph-by-Jennifer-Green.jpg"
      )
    end

    it "can retrieve ALL posters (index)" do

      get "/api/v1/posters"

      expect(response).to be_successful

      posters = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(posters.count).to eq(3)

      posters.each do |poster|
        
        expect(poster).to have_key(:id)
        expect(poster[:id].to_i).to be_an(Integer)
  
        expect(poster[:attributes]).to have_key(:name)
        expect(poster[:attributes][:name]).to be_a(String)
  
        expect(poster[:attributes]).to have_key(:description)
        expect(poster[:attributes][:description]).to be_a(String)
  
        expect(poster[:attributes]).to have_key(:price)
        expect(poster[:attributes][:price]).to be_a(Float)
        
        expect(poster[:attributes]).to have_key(:year)
        expect(poster[:attributes][:year]).to be_an(Integer)
        
        expect(poster[:attributes]).to have_key(:vintage)
        expect(poster[:attributes][:vintage]).to be_in([true, false])
        
        expect(poster[:attributes]).to have_key(:img_url)
        expect(poster[:attributes][:img_url]).to be_a(String)
      end
    end
  end
end