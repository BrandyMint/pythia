class FixArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :company_id_id
    add_column :articles, :duplicates_count, :integer, :null=>false, :default =>0
    add_column :feeds, :articles_count, :integer, :null=>false, :default =>0
  end
end
