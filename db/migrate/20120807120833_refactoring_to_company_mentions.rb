class RefactoringToCompanyMentions < ActiveRecord::Migration
  def change
    change_column :company_mentions, :company_id, :integer, :null => false
    change_column :company_mentions, :article_id, :integer, :null => false

    add_index :company_mentions, :company_id
    add_index :company_mentions, :article_id
  end
end


=begin
  create_table "company_mentions", :force => true do |t|
    t.integer  "company_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
=end
