class SettingsSubscriber
  def self.call(message)
    Rails.logger.info(message)
  end
end
