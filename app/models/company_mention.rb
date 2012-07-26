class CompanyMention < ActiveRecord::Base  

  attr_accessible :article_id, :company_id

  belongs_to :company
  belongs_to :article

  validates :company, :presence => true
  validates :article, :presence => true

  scope :by_company, lambda { |company| where :company_id=>company.id }
  scope :by_article, lambda { |article| where :article_id=>article.id }

end
