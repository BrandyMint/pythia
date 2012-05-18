class RssSource
    def self.update()
        require 'nokogiri'
        require 'open-uri'
        url = "http://cat.yandex.ru/yca/cat/Business"
        (1..9).each do |page|
            doc = Nokogiri::HTML(open(url))
            doc.css('h3.b-result__head a.b-result__name').each {|link| puts link.attr("href")} 
            url = "http://cat.yandex.ru/yca/cat/Business/#{page}.html"
        end
    end
end

RssSource.update