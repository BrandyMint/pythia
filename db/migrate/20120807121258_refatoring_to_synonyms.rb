class RefatoringToSynonyms < ActiveRecord::Migration
  def change
    rename_column :company_synonyms, :company_id_id, :company_id
    change_column :company_synonyms, :company_id, :integer, :null => false
    change_column :company_synonyms, :synonym, :string, :null => false

    add_index :company_synonyms, :company_id
    add_index :company_synonyms, :synonym
  end
end

=begin
  create_table "company_synonyms", :force => true do |t|
    t.integer  "company_id_id"
    t.string   "synonym"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end
=end
