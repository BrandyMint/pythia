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
    end    
  end

end