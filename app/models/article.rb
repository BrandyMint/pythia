# coding: utf-8
class Article < ActiveRecord::Base
  
  attr_accessible :title, :text, :url
  
  has_many :company_mentions
  has_many :companies, :through => :company_mentions
  belongs_to :feed
  
  scope :last_week, where('created_at >=? and created_at <= ?', 1.week.ago.to_s(:db), Time.now.to_s(:db))

  validates :text, :presence => true
  validates :url, :presence => true, :url => true

  after_create :search_and_create_companies_mentions

  def search_and_create_companies_mentions
    words.each do |word|
      company = Company.search_by_word word
      company_mentions.create :company_id => company.id if company
    end
  end
  
  def words
   text_article= self.title + " " + self.text
   @words ||= text_article.split(/\b/).select{ |word| word.size > 2 } 
  end

  def get_mentions_by_company company
    company_mentions.by_company company
  end

  def self.count_company_mentions
    CompanyMention.select('count(*)').group('article_id').all.count
  end

  def self.reload_company_mention
    CompanyMention.delete_all
    articles = Article.all
    articles.each do |article|
      article.search_and_create_companies_mentions
    end
  end
  
  def to_s
    title
  end

  def self.get_mention_by_day day
    # Возращает число упоминаний в текущий день
    CompanyMention.select("count(*) as count_mention, created_at as date_created").group('created_at').having('date(created_at) = date(?)', day.to_s(:db)).all.count
  end
end
