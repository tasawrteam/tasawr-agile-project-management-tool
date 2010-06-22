class CreateBacklogItems < ActiveRecord::Migration
  def self.up
    create_table :backlog_items do |t|
      t.integer :product_backlog_id
      t.integer :user_id
      t.integer :item_priority
      t.integer :item_size
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :backlog_items
  end
end
