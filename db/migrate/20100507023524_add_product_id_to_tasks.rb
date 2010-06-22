class AddProductIdToTasks < ActiveRecord::Migration

  def self.up
    add_column :tasks, :product_id, :integer
  end

  def self.down
    remove_column :tasks, :product_id
  end
end
