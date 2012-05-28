# coding: utf-8
require 'open-uri'

class Feed < ActiveRecord::Base
  validates :name, :presence => true  
  validates :url, :presence => true  
  attr_accessible :name, :url
  belongs_to :source
  has_many :articles
  
  def update_articles
    # url = берем из Feed.find_each 
    url = 'http://news.yandex.ru/business.rss'
    #Feed.find_each do |url|
      doc = SimpleRSS.parse(open(url))
      doc.items.each do |msg|
           self.articles.create(:title => msg.title, :url => msg.link, :text => msg.description)
       end
    #end
  end
    
end
