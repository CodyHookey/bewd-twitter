class TweetsController < ApplicationController
  def create

    if current_user
      @tweet = current_user.tweets.new(tweet_params)

      if @tweet.save
        render 'tweets/create'
      else
        render json: { success: false }
      end
    else
      render json: { success: false }
    end
  end

  def destroy
    @tweet = Tweet.find_by(id: params[:id])

    if @tweet.user == current_user and @tweet&.destroy
      render json: { success: true}
    else
      render json: { success: false}
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message)
  end

  def current_user
    token = cookies.signed[:twitter_session_token]
    session = Session.find_by(token: token)
    session&.user
  end
end
