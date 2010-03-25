require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = 'http://www.boardgamegeek.com/browse/boardgame'
path = '#collectionitems tr .collection_objectname'

doc = Nokogiri::HTML(open(url))
puts doc.inspect
# puts doc.at_css('title').text
# puts doc.css('#collectionitems').inspect
# doc.css(path).each do |item|
#   name = item.at_css('a').text
#   puts "Name: #{name}"
# end
