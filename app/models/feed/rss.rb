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

    rescue ActiveRecord::StatementInvalid
      puts  "Article is not paramentr == url.length >255, title.length > 255"
      # TODO: действие с статьей
    end
  end

end