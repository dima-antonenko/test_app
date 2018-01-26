class ParsersController < ApplicationController

  require 'nokogiri'
  require 'open-uri'


  def test
    product_category = ProductCategory.first
    @doc = Nokogiri::HTML(open(product_category.source_url))
    @products = @doc.css('#content .subcategory-product-item')
    @max_page = @doc.css('.page_listing .last a')[0].text
  end
end
