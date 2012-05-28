class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url, :null => false
      t.text :text, :null => false
      
      t.timestamps
    end
  end
end
