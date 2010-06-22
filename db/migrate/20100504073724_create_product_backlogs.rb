class CreateProductBacklogs < ActiveRecord::Migration
  def self.up
    create_table :product_backlogs do |t|
      t.string :name
      t.string :icon_path
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :product_backlogs
  end
end
