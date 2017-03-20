class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :post_id
      t.references :notificable, polymorphic: true

      t.timestamps
    end

    add_index :notifications, [:notificable_id, :notificable_type]
  end
end
