class SettingsSubscriber
  def self.call(data)
    puts "no op"
    # todo: change_events

    # mapped_data = {
    #   version:          data.fetch(:version),
    #   settings_guid:    data.fetch(:guid),
    #   fee_enabled:      data.fetch(:fee_enabled),
    #   discount_enabled: data.fetch(:discount_enabled),
    # }

    # Setting.update_from_message!(mapped_data)
  end
end
