class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :url
      # source_id :source 

      t.timestamps
    end
  end
end
