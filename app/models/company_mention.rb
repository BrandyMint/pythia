class CompanyMention < ActiveRecord::Base  
  
  belongs_to :company
  belongs_to :article
  
  # TODO 
  

  ## это еще зачем? есть же scope arcicles.last_week его и нужно исопльзовать
  #def last_week_articles
  #  articles.last_week
  #end
  
end