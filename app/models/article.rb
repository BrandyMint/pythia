# coding: utf-8
class Article < ActiveRecord::Base
  
  attr_accessible :title, :text, :url
  
  has_many :company_mentions
  has_many :companies, :through => :company_mentions
  belongs_to :feed
  
  scope :last_week, where('created_at >=? and created_at <= ?', 1.week.ago.to_s(:db), Time.now.to_s(:db))
  
  validates :text, :presence => true
  validates :url, :presence => true, :url => true

  after_create :search_company_by_word

  def search_and_create_companies_mentions
    text_article= self.title + " " + self.text
    all_world = text_article.split(/\b/).select{ |word| word.size > 2 }
    all_word.each do |word|
      company = Company.search_by_word word
      company_mentions.create :article_id => self.id, :company_id => company_id if company
    end
    
  end

end