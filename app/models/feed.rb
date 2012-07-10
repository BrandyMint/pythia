# coding: utf-8
require 'open-uri'
# Валидация и уникальный ключ для Feed
class Feed < ActiveRecord::Base

# TODO не верный порядок описания. Сначала идут аттритубы, затем ассоциации, затем валидация

  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true, :uniqueness => true, :url => true
  attr_accessible :name, :url
  belongs_to :source
  has_many :articles
  
  def update_articles
    # url = берем из Feed.find_each 
    # Что тут делает этот линк?
    url = 'http://news.yandex.ru/business.rss'
    #Feed.find_each do |url|
      doc = SimpleRSS.parse(open(url))
      doc.items.each do |msg|
           self.articles.create(:title => msg.title, :url => msg.link, :text => msg.description)
       end
    #end
  end
    
end
