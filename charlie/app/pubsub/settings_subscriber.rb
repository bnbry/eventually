class SettingsSubscriber
  def self.call(raw_message)
    puts raw_message
    message = JSON.parse(raw_message).deep_symbolize_keys

    # version:     setting.version,
    # guid:        setting.guid,
    # foo_enabled: setting.foo_enabled,
    # bar_enabled: setting.bar_enabled,
    # timestamp:   Time.now.utc,

    foo_setting = Setting.find_by(name: "foo", guid: message[:guid])

    if message[:version] > foo_setting.version
      status = message[:foo_enabled] ? "enabled" : "disabled"
      foo_setting.update(status: status, version: message[:version])
    end
  rescue StandardError
    puts "an error happened but we're gonna keep rolling"
  end
end
