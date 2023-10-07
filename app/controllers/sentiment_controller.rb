class SentimentController < ApplicationController
  def index
    @submitted_text = params&.dig(:sentiment_form, :text)
    @sentiment = OpenaiHelper.get_sentiment(@submitted_text) if @submitted_text
  end
end
