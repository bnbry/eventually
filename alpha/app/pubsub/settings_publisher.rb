class SettingsPublisher
  def self.call(setting)
    $redis.publish(
      "settings-changes",
      {
        version:     setting.version,
        guid:        setting.guid,
        foo_enabled: setting.foo_enabled,
        bar_enabled: setting.bar_enabled,
        timestamp:   Time.now.utc,
      }.to_json
    )
  end
end
