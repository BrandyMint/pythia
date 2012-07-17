class CompanyMention < ActiveRecord::Base  
  
  attr_accessible :article_id, :company_id

  belongs_to :company
  belongs_to :article
  
  validates :company, :presence => true
  validates :article, :presence => true
  
  def self.get_mentions_by_article article
    scope :get_mentions_by_article_scope, where('article_id = ?', article.id).group('article_id')
  end

  def self.get_mentions_by_company company
    scope :get_mentions_by_company_scope, where('company_id = ?', company.id).group('company_id')
  end
end
