# coding: utf-8
class Article < ActiveRecord::Base
  
  attr_accessible :title, :text, :url
  
  has_many :company_mentions
  has_many :companies, :through => :company_mentions
  belongs_to :feed
  
  scope :last_week, where('created_at >=? and created_at <= ?', 1.week.ago.to_s(:db), Time.now.to_s(:db))
  
  validates :text, :presence => true
  validates :url, :presence => true, :url => true

  after_create :extract_companies

  def extract_companies
    Company.all.each do |company|
      search_mention company
    end
  end

  def search_mention company
    generate_word.each do |word|
      if word.index company.name
        CompanyMention.create :company_id => company.id, :article_id => self.id
      end
    end
  end

  def generate_word
    all_word = (self.title + self.text).split
  end

  # переписать
  def self.company_mentions_count_by_date
    sql = ActiveRecord::Base.connection
     sql_result = sql.execute("select date(created_at) as date_created, count(articles.id) as count_articles
          from articles right join company_mentions on company_mentions.article_id = articles.id
          group by date_created")
    

    count_by_date = {} #date => count_mention
    sql_result.each do |record|
      date = record["date_created"]
      counter = record["count_articles"]
      count_by_date[date] = counter
    end    
    count_by_date
  end

  # move to company_mention?
  def get_mentions_by_company company
    scope :get_mentions_by_company, where('company_id = ?', company.id)
  end

end