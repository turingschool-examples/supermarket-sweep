require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class Shopping_cartTest < Minitest::Test

  def test_it_exists

    cart = Shopping_cart.new("King Soopers", "30items")

    assert_instance_of Shopping_cart, cart
  end

  def test_it_has_a_name
    cart = Shopping_cart.new("King Soopers", "30items")

    assert_equal "King Soopers", cart.name
  end

  def test_it_has_a_capacity
    cart = Shopping_cart.new("King Soopers", "30items")

    assert_equal "30items", cart.capacity
  end



end
