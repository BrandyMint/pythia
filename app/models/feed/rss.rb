# coding: utf-8
require 'open-uri'
require 'feedzirra'
class Feed::Rss < Feed

  before_validation do
    # puts "Feed:validate #{url}"
    # self.source ||= Source.find_by_name 'manual'
    # self.name ||= dom.title
    # переписать!
    lenta  = Feedzirra::Feed.fetch_and_parse(url)
    self.name = lenta.title

  end

  def collect_articles
    lenta = Feedzirra::Feed.fetch_and_parse(url)
    self.name = lenta.title
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


=begin
  1.9.3p125 :021 > lenta.entries.first
  <Feedzirra::Parser::RSSEntry:0x0000000724bf88 @title="Медведев спустился в угольную шахту \"Листвяжная\"", @url="http://news.yandex.ru/yandsearch?cl4url=www.rosbalt.ru%2Ffederal%2F2012%2F08%2F06%2F1019407.html&cat=6&lang=ru", @summary="Глава российского правительства Дмитрий Медведев в понедельник проведет совещание по развитию угольной промышленности в Ленинск-Кузнецком Кемеровской области, а также посетит шахту &quot;Комсомолец&quot;, на которой в конце июля произошел пожар, сообщили в пресс-службе кабинета министров.", @published=2012-08-06 13:05:19 UTC, @entry_id="http://news.yandex.ru/yandsearch?cl4url=www.rosbalt.ru%2Ffederal%2F2012%2F08%2F06%2F1019407.html&cat=6&lang=ru"> 
=end
