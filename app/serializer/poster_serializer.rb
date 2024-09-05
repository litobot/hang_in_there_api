class PosterSerializer
  def self.format_posters(posters) # Format more than one poster at a time
    { 
      "data": posters.map do |poster|
        {
          "id": poster.id,
          "type": "poster",
          "attribures": {
            "name": poster.name,
            "description": poster.description,
            "price": poster.price,
            "year": poster.year,
            "vintage": poster.vintage,
            "img_url": poster.img_url
          }
        }
      end
    }
  end

  def self.format_poster(poster) # Format ONE poster at a time
    {
      "data":
        {
          "id": poster.id,
          "type": "poster",
          "attributes": {
            "name": poster.name,
            "description": poster.description,
            "price": poster.price,
            "year": poster.year,
            "vintage": poster.vintage,
            "img_url": poster.img_url
          }
        }
    }
  end
end