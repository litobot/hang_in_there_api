class Poster < ApplicationRecord
  def self.sort(posters, params)
    if params[:sort] == "asc"
      posters.order(created_at: :asc)
    elsif params[:sort] == "desc"
      posters.order(created_at: :desc)
    else
      posters
    end
  end
end