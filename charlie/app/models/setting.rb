class Setting < ApplicationRecord
  def self.update_from_message!(mapped_data)
    puts "no op"
    # todo: change_transition
    # fee_setting = find_by(name: "fee", guid: mapped_data[:guid])
    # fee_setting.update(status: mapped_data[:status], version: mapped_data[:version])
  end
end
