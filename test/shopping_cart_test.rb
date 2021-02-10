require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test

  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
  end

  def test_it_has_a_name
    assert_equal "King Soopers", @cart.name
  end

  def test_it_has_capacity
    assert_equal 30, @cart.capacity
  end

  def test_products_is_empty_array
    assert_equal [], @cart.products
  end

  def test_it_can_add_product
    @cart.add_product(@product1)
    @cart.add_product(@product2)

    assert_equal [@product1, @product2], @cart.products
  end

  def test_cart_has_details
    cart_details = {name: "King Soopers", capacity: 30}

    assert_equal cart_details, @cart.details
  end

  def test_it_can_count_sum_of_products
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    # require "pry"; binding.pry
    assert_equal 13, @cart.total_number_of_products
  end

end
