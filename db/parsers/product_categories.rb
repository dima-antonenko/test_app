require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://www.citilink.ru/catalog/mobile/"))
categories_node = doc.css('#content h2 a')


ProductCategory.destroy_all
categories_node.each do |category_node|
  ProductCategory.create(name: category_node.text.lstrip,
                         source_url: category_node.attr('href'),
                         parsed: false)
end  
