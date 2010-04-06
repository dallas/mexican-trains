require 'rubygems'
require 'nokogiri'

input   = File.join(File.dirname(__FILE__), 'boardgamegeek_scrape.html')
output  = File.join(File.dirname(__FILE__), 'lib', 'forgery', 'dictionaries', 'games')
path    = '#collectionitems tr .collection_objectname'

doc = Nokogiri::HTML File.read(input)
file = File.open output, 'w'
file.write doc.css(path).map {|i| i.at_css('a').text}.join("\n")
file.close
