class AddOriginalArticleToArticles < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.integer :original_article
    end
  end
end
