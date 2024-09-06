require "rails_helper"

RSpec.describe "Destroy Action" do
  it "can destroy a poster" do
    poster = Poster.create!(        
      name: "Litobot",
      description: "Binary Solo",
      price: 133,
      year: 1987,
      vintage: true,
      img_url: "https://yt3.googleusercontent.com/ytc/AIdro_lb1GklIVQ50j-fGpL-Zgn3-FYpX9jER4t9qT-buMrjVQ=s160-c-k-c0x00ffffff-no-rj")

      expect(Poster.count).to eq(1)

      delete "/api/v1/posters/#{poster.id}"

      expect(response).to be_successful
      expect(Poster.count).to eq(0)
      expect{ Poster.find(poster.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  # Alternative method I wanted to try to see if this works equally
  xit "can destroy an poster" do
    poster = create!(:poster)
  
    # Essentially this compares what the change in poster counts is before and after the poster is deleted.  In this case, we're expecting a change of -1.
    expect{ delete "/api/v1/posters/#{poster.id}" }.to change(Poster, :count).by(-1)
  
    expect{ Poster.find(poster.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end

