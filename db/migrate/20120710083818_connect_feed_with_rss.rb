class ConnectFeedWithRss < ActiveRecord::Migration
  def up
    change_table :feeds do |t|
      t.string :type, :null => false
    end
    # Feed.update_all ["type = ?", "Feed::Rss"]
  end
 
  def down
    remove_column :feeds, :type
  end
end
