module OpenaiHelper
  CLIENT = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])

  def self.tweet_sentiment_prompt tweet
    <<~PROMPT
      You are analyzing the sentiment of a tweet.  Please respond with "positive", "negative", or "neutral".
      The tweet is: #{tweet}
    PROMPT
  end

  def self.get_tweet_sentiment tweet
    response = CLIENT.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{role: "user", content: self.tweet_sentiment_prompt(tweet) }],
        temperature: 0.2,
      }
    )
    response.dig("choices", 0, "message", "content")
  end
end