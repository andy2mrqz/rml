class SentimentController < ApplicationController
  def index
    @submitted_text = params&.dig(:sentiment_form, :text)
    @text_array = @submitted_text&.split("\n\n")
    @sentiment_array = []

    if @text_array
      @text_array.each do |text|
        @sentiment_array << OpenaiHelper.get_sentiment(text)
      end
    end
  end
end
