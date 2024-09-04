class Api::V1::PostersController < ApplicationController
  def index
    render json: Poster.all  # We're calling the poster model (singular)
  end

  def show
    render json: Poster.find(params[:id])
  end
end