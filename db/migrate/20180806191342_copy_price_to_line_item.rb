class CopyPriceToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :price, :decimal
    LineItem.all.each do |t|
      k = Product.find(t.product_id).price
      t.price = k
      t.save!
    end
  end
end
