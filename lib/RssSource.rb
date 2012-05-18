class RssSource
  def self.update
    require "open-uri"
    require "nokogiri"
    url = "http://subscribe.ru/catalog/business?rss"
    id_next_page = 201
    is_end = false
    while not is_end
      begin
        doc = Nokogiri::HTML(open(url))
      rescue Exception => e
        is_end = true
      end
      is_rss = 0
      doc.css('span.lightblue a').each do |rss|
        is_rss = (is_rss + 1) % 2
        if is_rss == 0
          p rss.text  #for testing. add to model
        end
      end
      url = "http://subscribe.ru/catalog/business?rss&pos=#{id_next_page}"
      id_next_page += 200
    end
  end
end

RssSource.update