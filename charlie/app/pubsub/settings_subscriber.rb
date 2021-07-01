class SettingsSubscriber
  def self.call(data)
    puts "no op"
    # todo: change_transition
    # mapped_data = {
    #   guid:    data[:guid],
    #   status:  data[:fee_enabled] ? "enabled" : "disabled",
    #   version: data[:version],
    # }

    # Setting.update_from_message!(mapped_data)
  end
end
