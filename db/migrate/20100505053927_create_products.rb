class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :product_status, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
