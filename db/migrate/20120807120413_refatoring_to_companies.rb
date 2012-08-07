class RefatoringToCompanies < ActiveRecord::Migration
  def change
    change_column :companies, :name, :string, :null => false
    change_column :companies, :slug, :string, :null => false

    add_index :companies, :name
    add_index :companies, :slug
  end
end

=begin
  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end
=end

