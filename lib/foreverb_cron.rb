require 'forever'

Forever.run do

  every 30.minutes, :at => "00:00" do
    Importer.new.import_articles
  end

  every 1.day, :at => ['00:30']
    Importer.new.import_companies
  end

end