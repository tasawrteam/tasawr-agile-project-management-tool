class CreateSprints < ActiveRecord::Migration
  def self.up
    create_table :sprints do |t|
      t.integer :product_id
      t.integer :user_id
      t.string :name
      t.text :description
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end

  def self.down
    drop_table :sprints
  end
end
