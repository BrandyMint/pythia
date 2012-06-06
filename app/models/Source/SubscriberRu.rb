require "open-uri"
require "nokogiri"


class Source::SubscrierRu < Source
  URL = "http://subscribe.ru/catalog/business?rss"
  
  # Брать по очереди все страницы с сайта
  # в результате искать rss-ки и скалдывать их в feed
  def update_feeds
    site_pages.each do |page|
      page.each do |parsed_feed|
        self.feeds.create :name => parsed_feed.name, :url => parsed_feed.url
      end
    end
  end
  
  private
  
  def site_pages
    page = 0
    arr = []
    while doc = open_site page+=1 do
      arr << doc.
           css('span.lightblue a').
           each { |rss| rss.text.match("http:\/\/(.*?)\/")[1] }.
           select_with_index{|item, i| item if i % 2 == 1}
    end
  end
  
  def open_site page
    Nokogiri::HTML( open( site_url page ) )
    rescue OpenURI::HTTPError
  end
   
  def site_url page=1
     URL + "&pos=#{page*200+1}"
  end
  
end