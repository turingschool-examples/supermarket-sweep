require 'minitest/autorun'
require 'minitest/pride'
require './lib/shopping_cart'
require './lib/product'

class ShoppingCartTest < Minitest::Test
  def test_it_exists_and_has_attributes
    cart = ShoppingCart.new("name", "capacity")

    assert_instance_of ShoppingCart, cart
  end

  def test_cart_name
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal "King Soopers", cart.name
  end

  def test_cart_capacity
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal 30, cart.capacity
  end

  def test_cart_starts_with_no_products
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal [], cart.products
  end

  def test_add_product
    cart = ShoppingCart.new("King Soopers", "30items")

    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal [product1, product2], cart.products
  end

  def test_cart_has_details
    cart = ShoppingCart.new("King Soopers", "30items")
    result = {name: "King Soopers", capacity: 30}

    assert_equal result, cart.details
  end

  def test_total_number_of_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 13, cart.test_total_number_of_products
  end

  def test_is_full
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal false, cart.is_full?

    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product4)

    assert_equal true, cart.is_full?
  end

  def test_products_by_category
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    result = [product1, product3]

    assert_equal result, cart.test_products_by_category(:paper)
  end 
end
