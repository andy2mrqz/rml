class TweetsController < ApplicationController
  def index
    @tweet = params&.dig(:tweet_form, :tweet)
    @sentiment = OpenAIHelper.get_tweet_sentiment(@tweet) if @tweet
  end
end
