require './lib/product'
require './lib/shopping_cart'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
class ShoppingTest < Minitest::Test
  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    #binding.pry
  end
  def test_it_exists
    assert_instance_of ShoppingCart, @cart
  end
  def test_it_has_name

    assert_equal @cart.name, 'King Soopers'
  end
  def test_it_has_capacity
    @cart.change_capacity_to_int
    assert_equal @cart.capacity, 30
  end
  def test_can_add_products
    assert_equal @cart.products, [@product1, @product2]
  end
  def test_has_correct_details
    @cart.change_capacity_to_int
    @cart.find_details
    assert_equal @cart.details, {name: "King Soopers", capacity: 30}
  end
end