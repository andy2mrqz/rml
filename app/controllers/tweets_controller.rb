class TweetsController < ApplicationController
  def index
    twitter_handle = params&.dig(:user, :twitter_handle)
    if twitter_handle.nil?
      puts ">>> no handle provided"
      @tweets = []
    else
      puts ">>> " + twitter_handle
      # TODO: Fetch tweets given handle
      @tweets = ["hi", "hello", "hola"]
    end
  end
end
