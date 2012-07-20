#!/usr/bin/env ruby
require File.expand_path('../../config/application', __FILE__)
require 'forever'


Forever.run :fork => true do

  # dir  "foo"     # Default: File.expand_path('../../', __FILE__)
  # file "bar"     # Default: __FILE__
  # log  "bar.log" # Default: File.expand_path(dir, '/log/[file_name].log')
  # pid  "/tmp/foreverb_cron.pid" # Default: File.expand_path(dir, '/tmp/[file_name].pid')

  before :each do
    # require '../config/boot' # here the rails/padrino environment
  end

  # update_articles
  every 15.minutes do
    Feed.last.collect_article #news.yandex
  end

  every 1.minutes do
    Feed.last.articles.create :title => "foreverb_cron", :text => "test test test", :url => 'http://yandex.ru'
  end

end