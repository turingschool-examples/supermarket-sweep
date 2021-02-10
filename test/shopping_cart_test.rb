require './lib/product'
require './lib/shopping_cart'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
class ShoppingTest < Minitest::Test
  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")
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
end