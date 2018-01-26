class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.string :name, index: true
      t.string :source_url, index: true
      t.boolean :parsed, index: true
    end
  end
end
