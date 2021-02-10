require_relative 'test_helper'


class ShoppingCartTest < Minitest::Test

  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")

    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
  end

  def test_it_exists
    assert_instance_of ShoppingCart, @cart
  end

  def test_it_has_name
    assert_equal "King Soopers", @cart.name
  end

  def test_it_has_products
    assert_equal "30items", @cart.capacity
  end

  def test_it_has_no_products
    assert_equal [], @cart.products
  end

  def test_it_can_add_products_to_cart
    @cart.add_product(@product1)
    @cart.add_product(@product2)

    assert_equal [@product1, @product2], @cart.products
  end

  def test_it_can_return_cart_details
    skip
    expected = {name: "King Soopers", capacity: 30}

    assert_equal expected, @cart.details
  end




end
