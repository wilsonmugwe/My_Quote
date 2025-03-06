class AddUserIdToQuotes < ActiveRecord::Migration[7.0]
  def change
    add_column :quotes, :user_id, :integer
    add_index :quotes, :user_id  # Optional, improves lookup performance
  end
end
