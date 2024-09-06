require "rails_helper"

RSpec.describe "AR Queries" do
  describe "GET request actions with count" do
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

    it "Can count the number of returned posters displayed" do

      get "/api/v1/posters"

      expect(response).to be_successful

      posters = JSON.parse(response.body, symbolize_names: true)

      expect(posters).to have_key(:meta)
      expect(posters[:meta][:count]).to eq(3)

      expect(posters[:data].count).to eq(3)
    end
  end
end