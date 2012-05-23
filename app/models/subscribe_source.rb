require "open-uri"
require "nokogiri"


class SubscribeSource < Source

  def update_feeds
    url = "http://subscribe.ru/catalog/business?rss"
    id_next_page = 201  #for next page
    is_end = false
    
    while not is_end
      begin
        doc = Nokogiri::HTML(open(url))
      rescue OpenURI::HTTPError => e
        is_end = true
      end

      is_rss = true
      doc.css('span.lightblue a').each do |rss|
        is_rss = !is_rss
        if is_rss
          name_site = rss.text.match("http:\/\/(.*?)\/")[1]
          #puts name_site, rss.text          
          self.feeds.create(:name =>name_site, :url => rss.text)
        end

      end
      url = "http://subscribe.ru/catalog/business?rss&pos=#{id_next_page}"
      id_next_page += 200
      
    end
  end
end