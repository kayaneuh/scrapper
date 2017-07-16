require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

prix = page.css("a[class=price]")
prix.each{|link| puts link['data-usd']}
money = page.css("img[class=currency-logo]")
money.each{|link| puts link['alt']}