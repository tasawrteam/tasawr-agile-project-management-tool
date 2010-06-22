class AddProductIdToBacklogItems < ActiveRecord::Migration
  def self.up
    add_column :backlog_items, :product_id, :integer
  end

  def self.down
    remove_column :backlog_items, :product_id
  end
end
