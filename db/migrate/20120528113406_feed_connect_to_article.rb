class FeedConnectToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :feed_id, :integer, :null => false
  end
end
