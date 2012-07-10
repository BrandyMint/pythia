# coding: utf-8

class Article < ActiveRecord::Base
  has_many :company_mentions
  has_many :companies, :through => :company_mentions
  belongs_to :feed
  
  validates :text, :presence => true
  validates :url, :presence => true, :url => true

  attr_accessible :title, :text, :url

  after_create :reindex!
  after_update :reindex!

  searchable do
    text :title, :text
  end

  scope :last_week, where('created_at >=? and created_at <= ?', 1.week.ago.to_s(:db), Time.now.to_s(:db))

  def search_company
    Company.find_each do |company|
      update_mentions_company company if find_company_in_article company
    end
  end


  def delete_if_this_dublicate
    Article.find_each do |article|
      self.delete if article.title == self.title and (article.id != self.id)
    end

  end

  def find_companies_through_sunspot
    Company.all.each do |company|
      search = Company.search {fulltext company.name}
      result = search.result
  end
    
  end

  def find_companies
    Company.all.each do |company|
      self.companies << company if include_company? company
    end
  end
  
  def include_company? company
     self.title.index(company.name) or self.text.index(company.name)
  end

  
protected
  
  def reindex!
    Sunspot.index!(self)  
  end

end
