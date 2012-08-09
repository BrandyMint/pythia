class SaveIntervalToFeeds < ActiveRecord::Migration
  def change
    change_table :feeds do |t|
      t.integer :ttl
      t.timestamp :collect_started_at
      t.timestamp :collect_finished_at
      t.timestamp :interval_time_last_collected
      t.string :status
    end
  end
end



