class Setting < ApplicationRecord
  def self.update_from_message!(mapped_data)
    puts "no op"
    # todo: change_events

    # fee_setting = find_by(name: "fee", settings_guid: mapped_data[:settings_guid])
    # discount_setting = find_by(name: "discount", settings_guid: mapped_data[:settings_guid])

    # fee_setting.update(enabled: mapped_data[:fee_enabled], version: mapped_data[:version])
    # discount_setting.update(enabled: mapped_data[:discount_enabled], version: mapped_data[:version])
  end
end
