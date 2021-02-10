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
    assert_equal 30, cart.capacity
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

  def test_total_number_of_products
    cart = Shopping_cart.new("King Soopers", "30items")

    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 13, cart.total_number_of_products
  end

  def test_is_full?
    cart1 = Shopping_cart.new("King Soopers", "10items")
    cart2 = Shopping_cart.new("King Soopers", "30items")

    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart1.add_product(product1)
    cart1.add_product(product2)
    cart1.add_product(product3)

    cart2.add_product(product1)
    cart2.add_product(product2)
    cart2.add_product(product3)

    assert_equal true, cart1.is_full?
    assert_equal false,  cart2.is_full?
  end

  def test_produce_by_category
    cart = Shopping_cart.new("King Soopers", "30items")

    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal [product1, product3], cart.produce_by_category(:paper)
  end

  def test_percentage_occupied

    cart = Shopping_cart.new("King Soopers", "30items")

    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 43.33, cart.percentage_occupied
  end

end
