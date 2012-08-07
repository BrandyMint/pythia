class RefactoringToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :title, :string, :null => false

    add_index :articles, :title
    add_index :articles, :text
    add_index :articles, :created_at
    add_index :articles, :feed_id
    add_index :articles, :original_id
    add_index :articles, :perma_link
  end
end

=begin
create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "url",                             :null => false
    t.text     "text",                            :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "feed_id",                         :null => false
    t.integer  "original_id"
    t.string   "perma_link"
    t.string   "guid"
    t.integer  "duplicates_count", :default => 0, :null => false
  end
=end

