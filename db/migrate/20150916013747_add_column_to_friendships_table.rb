class AddColumnToFriendshipsTable < ActiveRecord::Migration
  def change
    add_column :friendships, :accepted_at, :datetime
  end
end
