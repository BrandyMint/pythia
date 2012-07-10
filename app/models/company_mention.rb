class CompanyMention < ActiveRecord::Base  
  
  belongs_to :company
  belongs_to :article
  

  def last_week_articles
    articles.last_week
  end
  
end