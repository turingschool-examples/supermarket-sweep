require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
  #Iteration2
  def test_cart_exists
    # skip
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_instance_of ShoppingCart, cart
    assert_equal "King Soopers", cart.name
    assert_equal [], cart.products
  end

  def test_add_product
    # skip
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal [product1, product2], cart.products
    # assert_equal {name: "King Soopers", capacity: 30}, cart.details
  end

  def test_full_cart
    # skip
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 13, cart.total_number_of_products
    # assert_equal false, cart.is_full?
    #
    # cart.add_product(product4)
    #
    # assert_equal true, cart.is_full?

    cart.products_by_category(:paper)

    assert_equal [product1, product3], cart.products_by_category(:paper)
  end
end
