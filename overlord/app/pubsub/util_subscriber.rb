class UtilSubscriber
  def self.call(raw_message)
    message = ::JSON.parse(raw_message).deep_symbolize_keys
    puts message
    ::Message.create_from_message!(message)
  rescue StandardError => e
    puts e.message
    puts "an error happened but we're gonna keep rolling"
  end
end
