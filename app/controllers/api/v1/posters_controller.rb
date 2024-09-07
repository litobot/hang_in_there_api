class Api::V1::PostersController < ApplicationController
  def index
    posters = Poster.filtered_and_sorted(params)
    render json: PosterSerializer.new(posters, meta: { count: posters.count })
  end

  def show
    poster = Poster.find(params[:id])
    render json: PosterSerializer.new(poster)
  end

  def create
    new_poster = Poster.create(poster_params)
    render json: PosterSerializer.new(new_poster), status: 201
  end

  def update
    updated_poster = Poster.update(params[:id], poster_params)
    render json: PosterSerializer.new(updated_poster)
  end

  def destroy
    render json: Poster.delete(params[:id])
  end

  private

  def poster_params
    params.require(:poster).permit(:name, :description, :price, :year, :vintage, :img_url)
  end
end