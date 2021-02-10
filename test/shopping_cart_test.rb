require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'
require 'pry'

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
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal "30items", cart.capacity
  end

  def test_it_has_products
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal [], cart.products

  end

  def test_add_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    assert_equal :paper, product1.category
    assert_equal 'toilet paper', cart.products[0].name
    assert_equal 3.70, product1.unit_price
    assert_equal '10', product1.quantity
    assert_equal :meat, product2.category
    assert_equal 'chicken', cart.products[1].name
    assert_equal 4.50, product2.unit_price
    assert_equal '2' , product2.quantity
    assert_equal :paper, product3.category
    assert_equal 'tissue paper', cart.products[2].name
    assert_equal 1.25 , product3.unit_price
    assert_equal '1' , product3.quantity
  end

  def test_total_number_of_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    assert_equal 13, cart.total_number_of_products(quantity)

  end

end
