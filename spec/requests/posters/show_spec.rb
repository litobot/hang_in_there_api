require "rails_helper"

RSpec.describe "Posters Endpoints" do
  describe "GET request actions" do
    it "can return exactly one poster (show)" do

      id = Poster.create!(
        name: "DESPAIR",
        description: "The light at the end of the tunnel might be an oncoming train.",
        price: 70.00,
        year: 2017,
        vintage: true,
        img_url: "https://i.pinimg.com/736x/66/cc/cb/66cccbf49897ad18d05661f3dfe7d846.jpg"
      ).id

      get "/api/v1/posters/#{id}"

      expect(response).to be_successful

      poster = JSON.parse(response.body, symbolize_names: true)[:data]
      
      # expect(poster.count).to eq(1) // Do we need this in the show test 

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