# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Source.create :name => :SubscriberRu, :url => '"http://ya.ru', :type => 'Source::SubscriberRu'

Source::Manual.create :name => :ManualRss, url: '"http://icfdev.ru' if Source.find_by_type 'Source::Manual'
Source::SubscriberRu.create :name=>:SubscriberRu, :url=>'"http://news.yandex.ru/business.rss' if Source.find_by_type 'Source::SubscriberRu'
Feed::Rss.create url: "http://news.yandex.ru/business.rss"
Feed::Rss.create url: "http://ria.ru/export/rss2/economy/index.xml"
Feed::Rss.create url: "http://www.vesti.ru/section.rss?cid=6"
Feed::Rss.create url: "http://www.rusnovosti.ru/rss/economics.xml"
Feed::Rss.create url: "http://www.gazeta.ru/export/rss/financial.xml"
Feed::Rss.create url: "http://feeds.newsru.com/com/www/section/finance"
Feed::Rss.create url: "http://news.rambler.ru/rss/popular/economics/"
Feed::Rss.create url: "http://www.vz.ru/rss.xml"
Feed::Rss.create url: "http://lenta.ru/rss/news/business/"
Feed::Rss.create url: "http://lenta.ru/rss/news/finance/"
Feed::Rss.create url: "http://lenta.ru/rss/news/economy"
Feed::Rss.create url: "http://news.mail.ru/rss/economics/"
Feed::Rss.create url: "http://feeds.feedburner.com/skyline2"
Feed::Rss.create url: "http://www.vestifinance.ru/yandex.xml"
Feed::Rss.create url: "http://static.feed.rbc.ru/rbc/logical/rbcdaily.ru/daily.rss"
Feed::Rss.create url: "http://feeds.feedburner.com/profi-forex/PYBo"
Feed::Rss.create url: "http://www.bfm.ru/news/rss/articles/"
Feed::Rss.create url: "http://expert.ru/doc-list/rss/"
Feed::Rss.create url: "http://expert.ru/doc-list/rss/?tags=3"
Feed::Rss.create url: "http://www.ng.ru/ng.rss"
Feed::Rss.create url: "http://www.rg.ru/xml/index.xml"
Feed::Rss.create url: "http://www.fontanka.ru/fontanka.rss"
Feed::Rss.create url: "http://www.bbc.co.uk/russian/index.xml"
