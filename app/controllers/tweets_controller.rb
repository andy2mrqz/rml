class TweetsController < ApplicationController
  def index
  end

  def show
    twitter_handle =  params[:user][:twitter_handle]
    # TODO: Fetch tweets given handle
    @tweets = ["hi", "hello", "hola"]
  end
end
