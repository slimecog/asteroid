class Api::V1::User::FavoritesController < ApplicationController
  def index
    user = ApiKey.find_by_value(params[:api_key]).user

    render json: user.favorites, each_serializer: FavoritesSerializer
  end

  def create
    user = ApiKey.find_by_value(params[:api_key]).user
    user.favorites.create(neo_reference_id: params[:neo_reference_id])

    render json: user.favorites.last, serializer: FavoritesSerializer
  end
end
