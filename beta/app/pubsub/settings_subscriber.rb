class SettingsSubscriber
  def self.call(raw_message)
    puts raw_message
    message = JSON.parse(raw_message).deep_symbolize_keys

    # version:     setting.version,
    # guid:        setting.guid,
    # foo_enabled: setting.foo_enabled,
    # bar_enabled: setting.bar_enabled,
    # timestamp:   Time.now.utc,

    foo_setting = Setting.find_by(name: "foo", settings_guid: message[:guid])
    bar_setting = Setting.find_by(name: "bar", settings_guid: message[:guid])

    if message[:version] > foo_setting.version
      foo_setting.update(enabled: message[:foo_enabled], version: message[:version])
    end

    if message[:version] > bar_setting.version
      bar_setting.update(enabled: message[:bar_enabled], version: message[:version])
    end
  rescue StandardError
    puts "an error happened but we're gonna keep rolling"
  end
end
