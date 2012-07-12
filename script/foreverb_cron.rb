require 'forever'
# TODO move to ./script/
Forever.run do

  every 30.minutes do
     Feed::Rss.collect_articles
  end

end