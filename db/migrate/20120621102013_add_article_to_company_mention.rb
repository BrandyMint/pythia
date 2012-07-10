class AddArticleToCompanyMention < ActiveRecord::Migration
  def change
    change_table :company_mentions do |t|
	  	t.rename :mention_count, :articled_id
	  	t.rename :created_at, :time_add
	  	t.remove :updated_at
	  end
  end
end