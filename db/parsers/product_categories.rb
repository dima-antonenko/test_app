require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://www.citilink.ru/catalog/mobile/"))
categories_node = doc.css('#content h2 a')

#product_categories = []
ProductCategory.destroy_all
categories_node.each do |category_node|
  #product_categories << {name: category_node.text.lstrip, link: category_node.attr('href')}
  ProductCategory.create(name: category_node.text.lstrip,
                         source_url: category_node.attr('href'),
                         parsed: false)
end  

#puts product_categories