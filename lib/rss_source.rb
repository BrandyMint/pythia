require "open-uri"
require "nokogiri"

class RssSource
  def self.updateFeeds
    url = "http://subscribe.ru/catalog/business?rss"
    id_next_page = 201  #for next page
    is_end = false
    
    while not is_end
      begin
        doc = Nokogiri::HTML(open(url))
      rescue OpenURI::HTTPError => e
        is_end = true
      end

      is_rss = 0
      doc.css('span.lightblue a').each do |rss|
        is_rss = (is_rss + 1) % 2
        if is_rss == 0
          /http:\/\/(.*?)\//.match rss.text
          name_site = $1
          #p name_site, rss.text #for testing
          Feed.create(:name =>name_site, :url => rss.text)
        end

      end
      url = "http://subscribe.ru/catalog/business?rss&pos=#{id_next_page}"
      id_next_page += 200
      
    end
  end
end
