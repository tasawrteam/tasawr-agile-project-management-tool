class CreateSprintBacklogItems < ActiveRecord::Migration
  def self.up
    create_table :sprint_backlog_items do |t|
      t.integer :product_id
      t.integer :sprint_id
      t.integer :user_id
      t.integer :backlog_item_id
      t.integer :status, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :sprint_backlog_items
  end
end
