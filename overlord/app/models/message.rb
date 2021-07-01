class Message < ApplicationRecord
  def self.create_from_message!(message)
    create!(
      event_name: message[:event_name],
      data:       message[:data],
      guid:       "message-#{(Time.zone.now.to_f * 1000).to_i}",
    )
  end
end
