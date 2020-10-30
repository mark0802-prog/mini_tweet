class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.save
    redirect_to root_path
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, tweet_id: params[:id])
    @favorite.destroy
    redirect_to root_path
  end

  private

  def favorite_params
    params.permit(:tweet_id).merge(user_id: current_user.id)
  end
end
