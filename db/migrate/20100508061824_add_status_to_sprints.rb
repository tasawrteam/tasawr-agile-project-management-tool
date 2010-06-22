class AddStatusToSprints < ActiveRecord::Migration
  def self.up
    add_column :sprints, :status, :integer, :default => 0
  end

  def self.down
    remove_column :sprints, :status
  end
end
