class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :link_id, null: false, foreign_key: true

      t.timestamps null: false
    end
    add_index :comments, :user_id
    add_index :comments, :link_id
  end
end
