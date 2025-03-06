class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fname, null: false
      t.string :lname, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :is_admin, default: false, null: false
      t.string :status, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
