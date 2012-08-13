class RenameColumnInFeeds < ActiveRecord::Migration
  def change
    remove_column :feeds, :interval_time_last_collected
    add_column :feeds, :last_collect_duration, :integer, :null => false, :default => 0
  end
end
