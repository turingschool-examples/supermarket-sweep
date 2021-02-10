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

  def test_it_exists_and_has_attributes
    assert_instance_of ShoppingCart, @cart
    assert_equal 'King Soopers', @cart.name
    assert_equal 30, @cart.capacity
  end

  def test_it_starts_with_no_products
    assert_equal [], @cart.products
  end

  def test_it_can_add_products
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    assert_equal [@product1, @product2], @cart.products
    assert_equal 2, @cart.products.length
  end

  def test_it_can_display_details
    expected = {name: "King Soopers", capacity: 30}
    assert_equal expected, @cart.details
  end

  def test_it_knows_total_number_of_products
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    assert_equal 13, @cart.total_number_of_products
  end

  def test_it_knows_when_full
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    assert_equal false, @cart.is_full?
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    @cart.add_product(product4)
    assert_equal true, @cart.is_full?
  end

  def test_it_knows_percentage_occupied
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    assert_equal 43.33, @cart.percentage_occupied
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    @cart.add_product(product4)
    assert_equal 110.00, @cart.percentage_occupied
    # assert_equal "10 % Over Capacity", @cart.percentage_occupied
  end

  def test_it_sorts_by_quantity
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    @cart.add_product(product4)
    expected = [product4, @product1, @product2, @product3]
    assert_equal expected, @cart.sorted_products_by_quantity
  end
end
