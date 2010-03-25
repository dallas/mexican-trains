require 'rubygems'
require 'nokogiri'

url   = File.join(File.dirname(__FILE__), 'boardgamegeek_scrape.html')
path  = '#collectionitems tr .collection_objectname'

doc = Nokogiri::HTML(File.read(url))
doc.css(path).each do |item|
  name = item.at_css('a').text
  puts "Name: #{name}"
end
