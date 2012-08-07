class RefactoringToSource < ActiveRecord::Migration
  def change
    change_column :sources, :name, :string, :null => false
    change_column :sources, :url, :string, :null => false


    add_index :sources, :name
    add_index :sources, :type
  end

end


=begin
  
  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type",       :null => false
  end


=end
