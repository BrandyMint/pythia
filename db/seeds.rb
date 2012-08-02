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
Feed::Rss.create url: "http://news.yandex.ru/business.rss", name: 'yandex.new'
Feed::Rss.create url: "http://ria.ru/export/rss2/economy/index.xml", name: 'ria news'
Feed::Rss.create url: "http://www.vesti.ru/section.rss?cid=6", name: 'vesti'
Feed::Rss.create url: "http://www.rusnovosti.ru/rss/economics.xml", name: 'rusnews'
Feed::Rss.create url: "http://www.gazeta.ru/export/rss/financial.xml", name: 'gazeta-ru'
Feed::Rss.create url: "http://feeds.newsru.com/com/www/section/finance", name: 'newsru'
Feed::Rss.create url: "http://news.rambler.ru/rss/popular/economics/", name: 'rambler'
Feed::Rss.create url: "http://www.vz.ru/rss.xml", name: 'vz'
Feed::Rss.create url: "http://lenta.ru/rss/news/business/", name: 'lenta business'
Feed::Rss.create url: "http://lenta.ru/rss/news/finance/", name: 'lenta finance'
Feed::Rss.create url: "http://lenta.ru/rss/news/economy", name: 'lenta economy'
Feed::Rss.create url: "http://news.mail.ru/rss/economics/", name: 'mail economy'
Feed::Rss.create url: "http://feeds.feedburner.com/skyline2", name: "investcafe" 
Feed::Rss.create url: "http://www.vestifinance.ru/yandex.xml", name: 'vestifinance'
Feed::Rss.create url: "http://static.feed.rbc.ru/rbc/logical/rbcdaily.ru/daily.rss", name: 'rbc'
Feed::Rss.create url: "http://feeds.feedburner.com/profi-forex/PYBo", name: 'forex'
Feed::Rss.create url: "http://www.bfm.ru/news/rss/articles/", name: 'bfm'
Feed::Rss.create url: "http://expert.ru/doc-list/rss/", name: 'expert-all'
Feed::Rss.create url: "http://expert.ru/doc-list/rss/?tags=3", name: 'expert-bisness'
Feed::Rss.create url: "http://www.ng.ru/ng.rss", name: 'indemedents gazeta'
Feed::Rss.create url: "http://www.rg.ru/xml/index.xm", name: 'rg'
Feed::Rss.create url: "http://www.fontanka.ru/fontanka.rss", name: 'fontanka'