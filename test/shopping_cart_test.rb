require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
  #Iteration2
  def test_it_exists
    cart = ShoppingCart.new('King Soopers', '30items')
    assert_instance_of ShoppingCart, cart

    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal [product1, product2], cart.products

    # require "pry"; binding.pry  ##pry@ cart.details looks correct
    # assert_equal {:name => "King Soopers", :capacity => 30}, cart.details

  end
  #Iteration3
  def test_products_added_cart_details
    cart = ShoppingCart.new('King Soopers', '30items')

    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 13, cart.total_number_of_products
    assert_equal false, cart.is_full?

    assert_equal 43.33, cart.percentage_occupied #Iteration4

    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product4)

    assert_equal true, cart.is_full?
    assert_equal [product1, product3], cart.products_by_category(:paper)

  end

end
