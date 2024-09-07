class Poster < ApplicationRecord
  def self.sort(posters, params)
    if params[:sort] == "asc"
      posters.order(:created_at)
    elsif params[:sort] == "desc"
      posters.order(created_at: :desc)
    else
      posters
    end
  end

  def self.filter(posters, params)
      posters.where('name ILIKE ?', "%#{params[:name]}%").order(:name)
  end
end
