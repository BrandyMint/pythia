class CompanyMention < ActiveRecord::Base  
  
  belongs_to :company
  belongs_to :article
  
  validates :company, :presence => true
  validates :article, :presence => true
    
end