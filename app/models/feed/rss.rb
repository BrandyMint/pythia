require 'open-uri'
class Feed::Rss < Feed

  def collect_articles
    begin
      lenta = SimpleRSS.parse(open(url))
      lenta.items.each do |msg|
        articles.create(:title => msg.title, :url => msg.link, :text => msg.description)
      end
    rescue OpenURI::HTTPError #and url.length > 255 
      puts "feed #{url} not avaible"

    rescue ActiveRecord::StatementInvalid
      puts  "Article is not paramentr == url.length >255, title.length > 255"
    end
  end

end


=begin
   ActiveRecord::StatementInvalid: PG::Error: ERROR:  value too long for type character varying(255)
=end
