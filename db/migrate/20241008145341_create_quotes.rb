class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :quote, null: false
      t.integer :publication, null: true
      t.boolean :is_public, default: true
      t.text :comments, null: true
      t.references :category, null: false, foreign_key: true  
      t.references :philosopher, null: false, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

