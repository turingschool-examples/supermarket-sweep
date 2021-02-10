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

  def test_it_has_a_list_of_products
    cart = Shopping_cart.new("King Soopers", "30items")
    assert_equal [], cart.products
  end

  def test_it_can_add_to_its_list_of_products
    cart = Shopping_cart.new("King Soopers", "30items")

    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal [product1, product2], cart.products
  end

end
