class RenameArticledIdToArticleId < ActiveRecord::Migration
  
  def change
    change_table :company_mentions do |t|
	    t.rename :articled_id, :article_id
	  end
  end
  
end
