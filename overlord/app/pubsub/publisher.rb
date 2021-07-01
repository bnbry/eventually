class Publisher
  def self.call(message)
    raw_message = message.merge(timestamp: Time.now.utc).to_json
    puts raw_message
    $redis.publish("eventually", raw_message)
  end
end
