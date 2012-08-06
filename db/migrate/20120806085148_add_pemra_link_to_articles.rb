class AddPemraLinkToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :perma_link, :string
  end
end
