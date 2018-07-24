require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end
  
  test "price must be positive" do
    product = Product.new(title: "My litle pony", description: "Another fluffy animal just waiting to be hugged. It smells like candy and is twice as addictive", image_url: "MyLitlePony.PNG")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
    
    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
    
    product.price = 1
    assert product.valid?
  end
  
  def new_product(image_url)
    Product.new(title: "Bjarne plush", description: "A small but very capable and hugable pug plush. It might be small, but what it lacks in size it makes up for in pure cuteness", price: 2, image_url: image_url)
  end
  
  test "Image_url" do
    ok = %w{fred.gif fred.jpg fred.png fred.JPG FRED.jpg http://a.b.c/x/y/z/fred.gif}
    bad = %w{fred.doc fred.gif/more fred.gif.more}
    
    ok.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} shouldn‘t be invalid" 
    end
    
    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} shouldn't be valid"
    end
    
end
end

