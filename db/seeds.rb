all_categories_keys = ProductCategory.all.collect{|category| category.id}


Product.destroy_all
100.times do |i|
  Product.create(name: "Тестовый товар №#{i}", price: (i*10)+50, product_category_id: all_categories_keys.sample)
end  