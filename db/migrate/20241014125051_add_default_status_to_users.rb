class AddDefaultStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :status, from: nil, to: 0  # assuming '0' represents `active` in the enum
  end
end
