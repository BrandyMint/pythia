# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#  cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#  Mayor.create(name: 'Emanuel', city: cities.first)

# Source.create :name => :SubscriberRu, :url => 'http://ya.ru', :type => 'Source::SubscriberRu'

Source::Manual.create name: 'ManualRss', url: 'http://yandex.ru'
Source::SubscriberRu.create :name=>:SubscriberRu, :url=>'"http://news.yandex.ru/business.rss'
=begin
 name: "news.yandex.ru", 
 url: "http://news.yandex.ru/business.rss", 
 source_id: 22, 
 type: nil, 
 articles_count: 0
=end


Feed::Rss.create url: "http://news.yandex.ru/business.rss", source_id: 22
Feed::Rss.create url: "http://ria.ru/export/rss2/economy/index.xml", source_id: 22
Feed::Rss.create url: "http://www.vesti.ru/section.rss?cid=6", source_id: 22
Feed::Rss.create url: "http://www.rusnovosti.ru/rss/economics.xml", source_id: 22
Feed::Rss.create url: "http://www.gazeta.ru/export/rss/financial.xml", source_id: 22
Feed::Rss.create url: "http://feeds.newsru.com/com/www/section/finance", source_id: 22
Feed::Rss.create url: "http://news.rambler.ru/rss/popular/economics/", source_id: 22
Feed::Rss.create url: "http://www.vz.ru/rss.xml", source_id: 22
Feed::Rss.create url: "http://lenta.ru/rss/news/business/", source_id: 22
Feed::Rss.create url: "http://lenta.ru/rss/news/finance/", source_id: 22
Feed::Rss.create url: "http://lenta.ru/rss/news/economy", source_id: 22
Feed::Rss.create url: "http://news.mail.ru/rss/economics/", source_id: 22
Feed::Rss.create url: "http://feeds.feedburner.com/skyline2", source_id: 22
Feed::Rss.create url: "http://www.vestifinance.ru/yandex.xml", source_id: 22
Feed::Rss.create url: "http://static.feed.rbc.ru/rbc/logical/rbcdaily.ru/daily.rss", source_id: 22
Feed::Rss.create url: "http://feeds.feedburner.com/profi-forex/PYBo", source_id: 22
Feed::Rss.create url: "http://www.bfm.ru/news/rss/articles/", source_id: 22
Feed::Rss.create url: "http://expert.ru/doc-list/rss/", source_id: 22
Feed::Rss.create url: "http://expert.ru/doc-list/rss/?tags=3", source_id: 22
Feed::Rss.create url: "http://www.ng.ru/ng.rss", source_id: 22
Feed::Rss.create url: "http://www.rg.ru/xml/index.xml", source_id: 22
Feed::Rss.create url: "http://www.fontanka.ru/fontanka.rss", source_id: 22
Feed::Rss.create url: "http://www.bbc.co.uk/russian/index.xml", source_id: 22
