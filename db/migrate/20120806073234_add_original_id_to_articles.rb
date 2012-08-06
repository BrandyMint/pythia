class AddOriginalIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :original_id, :integer
  end
end
