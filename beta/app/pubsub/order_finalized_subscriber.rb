class OrderFinalizedSubscriber
  def self.call(raw_message)
    message = JSON.parse(raw_message).deep_symbolize_keys
    puts message
  rescue StandardError
    puts "an error happened but we're gonna keep rolling"
  end
end
