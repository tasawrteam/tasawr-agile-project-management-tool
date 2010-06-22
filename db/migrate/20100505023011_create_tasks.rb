class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :backlog_item_id
      t.integer :user_id
      t.integer :task_status, :default => 0
      t.integer :task_type, :default => 0
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
