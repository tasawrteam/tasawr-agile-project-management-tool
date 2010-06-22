class AddProductIdToProductBacklogs < ActiveRecord::Migration
  def self.up
    add_column :product_backlogs, :product_id, :integer
  end

  def self.down
    remove_column :product_backlogs, :product_id
  end
end
