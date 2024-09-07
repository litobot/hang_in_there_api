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

  def self.filter(posters, name)
    if name.present?
      posters.where('name ILIKE ?', "%#{name}%")
    else
      posters
    end
  end
end