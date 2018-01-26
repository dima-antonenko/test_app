class ParsersController < ApplicationController

  require 'nokogiri'
  require 'open-uri'


  def test
    @doc = Nokogiri::HTML(open("https://www.citilink.ru/catalog/mobile/"))
    @categories = @doc.css('#content h2 a')
  end
end
