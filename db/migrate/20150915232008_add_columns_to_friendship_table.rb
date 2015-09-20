class AddColumnsToFriendshipTable < ActiveRecord::Migration
  def change
    add_column :friendships, :user_id, :integer
    add_column :friendships, :friend_id, :integer
    add_column :friendships, :status, :string
    add_column :friendships, :blocked, :boolean
    add_index :friendships, :friend_id
    add_index :friendships, :user_id
    change_column_null :friendships, :friend_id, false
    change_column_null :friendships, :user_id, false
  end
end
