require 'nokogiri'
require 'open-uri'

page = 1.to_s

product_category = ProductCategory.first
doc = Nokogiri::HTML(open(product_category.source_url + "?available=1&status=55395790&p=" + page))
product_nodes = doc.css('#content .subcategory-product-item')

products_to_base = []

product_nodes.each do |product_node|
  products_to_base << {name: product_node.css('.wrap-img a').attr('title').value,
                       price: product_node.css('.subcategory-product-item__price_standart .subcategory-product-item__price-num').text.strip.delete(' ').to_i }
end


puts products_to_base