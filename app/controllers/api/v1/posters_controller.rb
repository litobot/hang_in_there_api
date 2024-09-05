class Api::V1::PostersController < ApplicationController
  def index
    poster = Poster.all  # We're calling the poster model (singular)
    render json: PosterSerializer.format_posters(posters)
  end

  def show
    poster = Poster.find(params[:id])
    render json: PosterSerializer.format_posters(posters)

  end

  def create
    new_poster = Poster.create(poster_params)
    render json: PosterSerializer.format_poster(new_poster), status: 201
  end

  private

  def poster_params # This is how we define poster_params - otherwise it's undefined
    params.require(:poster).permit(:name, :description, :price, :year, :vintage, :img_url)
  end
end