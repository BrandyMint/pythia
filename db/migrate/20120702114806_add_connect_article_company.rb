class AddConnectArticleCompany < ActiveRecord::Migration
  def change
    # TODO проверить
    # class Article;
    # has_many :companies, :through => :company_mentions
    change_table :articles do |t|
      t.references :company_id 
    end
  end
end
