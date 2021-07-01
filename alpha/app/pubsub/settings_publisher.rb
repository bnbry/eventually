class SettingsPublisher
  def self.call(setting)
    puts "no op"
    # todo: change_events
    # ::UtilPublisher.call(
    #   {
    #     event_name: "settings",
    #     data: {
    #       version:          setting.version,
    #       guid:             setting.guid,
    #       fee_enabled:      setting.fee_enabled,
    #       discount_enabled: setting.discount_enabled,
    #     }
    #   }
    # )
  end
end
