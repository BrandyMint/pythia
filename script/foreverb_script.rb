#!/usr/bin/env ruby
# require File.expand_path('../../config/foreverb', __FILE__)
require 'Forever'

Forever.run :fork=>true do
  # extend ForeverbConfig
  # init_foreverb_config 'foreverb-cron'

  before :each do
    Rake::Task['environment'].invoke
  end

  every 15.minutes do
    Feed.last.collect_article #news.yandex
  end

end