# coding: utf-8

class Article < ActiveRecord::Base
  
  attr_accessible :url
  attr_accessible :title, :text, :url
  
  has_many :company_mentions
  has_many :companies, :through => :company_mentions
  belongs_to :feed
  
  scope :last_week, where('created_at >=? and created_at <= ?', 1.week.ago.to_s(:db), Time.now.to_s(:db))
  
  validates :text, :presence => true
  validates :url, :presence => true, :url => true

  after_create :extract_companies

  searchable do
    text :title, :text
  end

  # TODO: "extract_companies_with_solr" => "extract_companies_with"
  def extract_companies_with_solr
    companies = Company.all
    companies.each do |company|  
      search = Article.search do
        fulltext company.name
      end
      search.result.each do |result|
        puts result.body
      end
    end
  end

  def extract_companies
    Company.all.each do |company|
      self.companies << company if include_company? company
    end
  end  

  def include_company? company
    self.title.index(company.name) or self.text.index(company.name)
  end
end