class CreateFriendds < ActiveRecord::Migration[6.1]
  def change
    create_table :friendds do |t|
      t.integer :friend_id
      t.references :user, null: false, foreign_key: true
      t.string :request
      t.timestamps
    end
  end
end