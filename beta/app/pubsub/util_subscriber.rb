class UtilSubscriber
  using ::JSONDeepParse

  def self.call(raw_message)
    message = JSON.deep_parse(raw_message).deep_symbolize_keys
    puts message
    ::Subscribers.fetch(
      message[:event_name].to_sym,
      -> (_) { puts "no handler for #{message[:event_name]}" }
    ).call(message[:data])
  rescue StandardError => e
    puts e.message
    puts "an error happened but we're gonna keep rolling"
  end
end
