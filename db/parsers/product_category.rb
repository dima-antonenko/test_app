require 'nokogiri'
require 'open-uri'


# получаем все товары на одной странице категории
def get_products_from_page(product_category, page)
  product_nodes = Nokogiri::HTML(open(product_category.source_url + "?available=1&status=55395790&p=" + page.to_s)).css('#content .subcategory-product-item') ## все блоки с товарами на странице
  
  product_nodes.collect do |product_node|
    if product_node.css('.wrap-img a') != nil and product_node.css('.subcategory-product-item__price_standart .subcategory-product-item__price-num') != nil # проверка валидности верстки карточки товара
      {name: product_node.css('.wrap-img a').attr('title').value,
       price: product_node.css('.subcategory-product-item__price_standart .subcategory-product-item__price-num').text.strip.delete(' ').to_i }
    end
  end

end

# создание товаров для одной категории
def create_products_from_category(product_category, products)
  products.each do |product|
    product_category.products.create(name: product[:name], price: product[:price])
  end
  product_category.update_attribute(:parsed, true)
end


ProductCategory.where(parsed: false).each do |product_category|
  max_page = Nokogiri::HTML(open(product_category.source_url)).css('.page_listing .last a')[0].text.to_i # максимальная страница в списке пагинации
  category_products = []
  (1..max_page).each do |page|
    category_products += get_products_from_page(product_category, page)
    #puts "page: #{page}"
   # puts "category_products size: #{category_products.size} \n \n"
    sleep 3
  end
   category_products.collect{|product| create_products_from_category(product_category, products)}
end
