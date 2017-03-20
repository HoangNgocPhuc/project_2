class AddUnreadToNotification < ActiveRecord::Migration[5.0]
  def up
  	add_column :notifications, :read, :integer, default: 0
  end

  def down
  	remove_column :notifications, :read
  end
end
