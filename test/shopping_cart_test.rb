require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
  def test_it_exists
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_instance_of ShoppingCart, cart
  end

  def test_it_has_a_name
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal "King Soopers", cart.name
  end

  def test_it_has_capacity
    # skip
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal 30, cart.capacity
  end

  def test_it_has_empty_products
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal [], cart.products
  end

  def test_it_can_add_products
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal [product1], cart.add_product(product1)
    assert_equal [product1, product2], cart.add_product(product2)
  end

  def test_it_has_products
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    assert_equal [product1, product2, product3], cart.products
  end

  def test_it_has_details
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal [name: "King Soopers", capacity: 30], cart.details
  end

  def test_amount_of_products
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      cart = ShoppingCart.new("King Soopers", "30items")
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      assert_equal 13, cart.total_number_of_products
  end

end
