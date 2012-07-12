class CompanyMention < ActiveRecord::Base  
  
  belongs_to :company
  belongs_to :article
  
  validates :company, :null => false
  validates :article, :null => false

    
end