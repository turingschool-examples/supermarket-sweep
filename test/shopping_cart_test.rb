require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test

  def test_it_exists_and_has_attributes
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_instance_of ShoppingCart, cart
    assert_equal 'King Soopers', cart.name
    assert_equal 30, cart.capacity
  end

  def test_it_starts_with_no_products
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal [], cart.products
  end

  def test_it_can_add_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    cart.add_product(product1)
    cart.add_product(product2)
    assert_equal [product1, product2], cart.products
  end

  def test_it_has_detail
    cart = ShoppingCart.new("King Soopers", "30items")
    expected = {name: "King Soopers", capacity: 30}
    assert_equal expected, cart.details
  end
end
