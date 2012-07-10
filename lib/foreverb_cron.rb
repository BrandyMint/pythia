require 'forever'
# TODO move to ./script/
Forever.run do

  every 30.minutes do
     Source.collect_feeds
  end

end