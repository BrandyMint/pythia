# coding: utf-8
require 'open-uri'
require 'feedzirra'
class Feed::Rss < Feed

  # before_validation do
  #   # puts "Feed:validate #{url}"
  #   # self.source ||= Source.find_by_name 'manual'
  #   # self.name ||= dom.title
  #   true
  # end

  def collect_articles
    lenta = Feedzirra::Feed.fetch_and_parse(url)
    if lenta
      lenta.entries.each do |msg|
        articles.create(:title => msg.title, :url => msg.url, :text => msg.summary, :guid => msg.entry_id)
      end
      self.touch
    else
      puts "404 #{url}"
    end
  end
end