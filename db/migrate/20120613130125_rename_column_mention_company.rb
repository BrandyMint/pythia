class RenameColumnMentionCompany < ActiveRecord::Migration
  def change
  	change_table :company_mentions do |t|
  		t.rename :id_company, :company_id
  		t.rename :count_mention, :mention_count
  	end
end
end
