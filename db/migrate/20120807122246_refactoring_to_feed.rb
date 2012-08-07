class RefactoringToFeed < ActiveRecord::Migration
  def change
    change_column :feeds, :name, :string, :null => false
    change_column :feeds, :url, :string, :null => false

    add_index :feeds, :name
    add_index :feeds, :type
    add_index :feeds, :source_id
    add_index :feeds, :articles_count
  end
end

=begin
  create_table "feeds", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "source_id",      :default => 0, :null => false
    t.string   "type"
    t.integer  "articles_count", :default => 0, :null => false
  end
=end

