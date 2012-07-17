#!/usr/bin/env ruby

Forever.run :fork => true do
  before :each do
    require '/config/boot' # here the rails/padrino environment
  end

  # update_articles
  every 15.minutes do
    Feed.last.collect_article #news.yandex
  end

end
