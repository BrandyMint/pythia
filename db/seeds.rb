# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Source.create :name => :SubscriberRu, :url => 'http://ya.ru', :type => 'Source::SubscriberRu'

Source::Manual.create :name => :ManualRss, url: 'http://icfdev.ru' if Source.find_by_type 'Source::Manual'
Source::SubscriberRu.create :name=>:SubscriberRu, :url=>'http://news.yandex.ru/business.rss' if Source.find_by_type 'Source::SubscriberRu'
Feed::Rss.create :name=>:Rss_yandex, :url=>'http://news.yandex.ru/business.rss'