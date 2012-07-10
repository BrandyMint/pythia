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
  
  def reindex!
    Sunspot.index!(self)  
  end

  def self.update_articles
    articles = load_articles
    extract_companies articles
  end  

  def self.load_articles
    feeds = load_feeds
    articles = import_articles feeds
  end


  def self.load_feeds
    feeds = [Feed.last]
  end

  def self.import_articles feeds
    articles = []
    feeds.each do |feed|
      articles << get_articles(feed)
    end
    articles
  end

  def self.get_articles feed
    begin
      lenta = SimpleRSS.parse(open(feed.url))
      lenta.items.each do |msg|
        doc = feed.articles.create(:title => msg.title, :url => msg.link, :text => msg.description)
      end
    rescue OpenURI::HTTPError
      puts "feed #{feed.url} not avaible"
    end
  end


  def self.extract_companies articles
    articles.each { |article|  article.first.find_companies }
  end


  def self.find_companies
    Company.all.each do |company|
      self.companies << company if include_company? company
    end
  end  

  def self.include_company? company
    self.title.index(company.name) or self.text.index(company.name)
  end

end