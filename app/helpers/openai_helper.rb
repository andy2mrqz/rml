module OpenaiHelper
  CLIENT = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])

  def self.sentiment_prompt text
    <<~PROMPT
      You are analyzing the sentiment of some text.  Please respond with "positive", "negative", or "neutral".
      The text is: #{text}
    PROMPT
  end

  def self.get_sentiment text
    response = CLIENT.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{role: "user", content: self.sentiment_prompt(text) }],
        temperature: 0.2,
      }
    )
    response.dig("choices", 0, "message", "content")
  end
end