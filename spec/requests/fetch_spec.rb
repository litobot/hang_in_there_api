require "rails_helper"

RSpec.describe "Posters Endpoints" do
  describe "retrieval actions" do
    it "can retrieve ALL posters (index)" do

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

      get "api/v1/posters"

      expect(response).to be_successful

      posters = JSON.parse(response.body, symbolize_names: true)
      expect(posters.count).to eq(3)

      posters.each do |poster|
        expect(poster).to have_key(:id)
        expect(poster[:id]).to be_an(Integer)
  
        expect(poster).to have_key(:name)
        expect(poster[:name]).to be_a(String)
  
        expect(poster).to have_key(:description)
        expect(poster[:description]).to be_an(String)
  
        expect(poster).to have_key(:price)
        expect(poster[:price]).to be_an(Float)
        
        expect(poster).to have_key(:year)
        expect(poster[:year]).to be_an(Integer)
        
        expect(poster).to have_key(:vintage)
        expect(poster[:vintage]).to be_an(Boolean)
        
        expect(poster).to have_key(:img_url)
        expect(poster[:img_url]).to be_an(String)
      end
    end
  end
end