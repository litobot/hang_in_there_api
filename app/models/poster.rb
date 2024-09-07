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
    if params[:name].present?
      posters = posters.where('name ILIKE ?', "%#{params[:name]}%").order(:name)
    end

    if params[:min_price].present?
      posters = posters.where('price >= ?', params[:min_price])
    end

    if params[:max_price].present?
      posters = posters.where('price <= ?', params[:max_price])
    end

    posters
  end
end
