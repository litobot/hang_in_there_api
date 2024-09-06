require "rails_helper"

RSpec.describe "Posters Endpoints"do
  describe "PATCH request action" do
    it "updates an existing poster" do
      id = Poster.create(
        name: "Why us?", 
        description: "Why not you?", 
        price: 666.66, 
        year: 2050, 
        vintage: false, 
        img_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1hK05p6_h0ZRSQLoTEfibnE2Jz1A7KKv4g&s"
        ).id
      
      previous_name = Poster.last.name
      poster_params = { 
        name: "Just Because"
      }
      
      headers = {"CONTENT_TYPE" => "application/json"}
      
      patch "/api/v1/posters/#{id}", headers: headers, params: JSON.generate({poster: poster_params})
      
      poster = Poster.find_by(id: id)

      expect(response).to be_successful
      expect(poster.name).to_not eq(previous_name)
      expect(poster.name).to eq("Just Because")
    end
  end
end