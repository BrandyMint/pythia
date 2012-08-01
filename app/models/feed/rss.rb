 # coding: utf-8
require 'open-uri'
class Feed::Rss < Feed

  def collect_articles
    begin
      lenta = SimpleRSS.parse(open(url))
      lenta.items.each do |msg|
        articles.create(:title => msg.title, :url => msg.link, :text => msg.description)
      end
    rescue OpenURI::HTTPError
      puts "feed #{url} not avaible"
      logger.info("RSS_NOTIFICATION - RSS Feed not avaible #{url}")

    rescue ActiveRecord::StatementInvalid
      puts  "Article is not paramentr == url.length >255, title.length > 255"
      logger.info("RSS_NOTIFICATION - long #{msg.link} or #{msg.title} ")
      # TODO: действие с статьей
    end
  end

end