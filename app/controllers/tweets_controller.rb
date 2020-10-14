class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.includes(:user).reverse_order
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message).merge(user_id: current_user.id)
  end
end
