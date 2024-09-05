require "rails_helper"

RSpec.describe do
  describe "creating a new poster" do
    it "can create a new poster" do
      poster_params = {
        name: "James",
        description: "The Giant Peach",
        price: 120,
        year: 1977,
        vintage: true,
        img_url: "https://static.wikia.nocookie.net/james-and-the-giant-peach/images/7/73/Mr._Centipede.jpg/revision/latest?cb=20121211222633"
      }
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/posters", headers: headers, params: JSON.generate(poster: poster_params)

      created_poster = Poster.last

      expect(response).to be_successful
      
      expect(created_poster.name).to eq(poster_params[:name])
      expect(created_poster.description).to eq(poster_params[:description])
      expect(created_poster.price).to eq(poster_params[:price])
      expect(created_poster.year).to eq(poster_params[:year])
      expect(created_poster.vintage).to eq(poster_params[:vintage])
      expect(created_poster.img_url).to eq(poster_params[:img_url])
    end
  end
end