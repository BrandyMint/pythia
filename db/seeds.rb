# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Source.create :name => :SubscriberRu, :url => 'http://ya.ru', :type => 'Source::SubscriberRu'
Source.delete_all
Feed.delete_all

Source::SubscriberRu.create :name=>:SubscriberRu, :url=>'http://news.yandex.ru/business.rss'
Feed::Rss.create :name=>:Rss_yandex, :url=>'http://news.yandex.ru/business.rss'
