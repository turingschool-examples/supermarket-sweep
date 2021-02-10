require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
  def test_it_exists
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_instance_of ShoppingCart, cart
  end

  def test_it_has_attributes
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal 30, cart.capacity
    assert_equal [], cart.products
  end

  def test_you_can_add_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.products
    assert_equal [product1, product2], cart.products
    assert_equal 2, cart.products.length
  end

  def test_you_can_see_details
    cart = ShoppingCart.new("King Soopers", "30items")
    expected = {name: "King Soopers", capacity: 30}
    assert_equal expected, cart.details
  end

  def test_if_cart_is_full
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    assert_equal 13, cart.total_number_of_products
    assert_equal false, cart.is_full?
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product4)
    assert_equal true, cart.is_full?
  end

  def test_you_can_find_product_category
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal [product1, product3], cart.products_by_category(:paper)
  end

  #I HAVE NEVER ATTEMPTED ITERATION 4 BEFORE LET'S GO

  def test_percentage_of_cart_that_is_occupied
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.percentage_occupied

    assert_equal 43.33, cart.percentage_occupied
  end

  def test_you_can_sort_products_by_quantity
  end

  def test_you_can_breakdown_products_by_category
  end
end
