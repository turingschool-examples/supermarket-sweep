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
    @product4 = Product.new(:produce, 'apples', 0.99, '20')
  end

  def test_it_exists
    assert_instance_of ShoppingCart, @cart
  end

  def test_it_has_a_name
    assert_equal "King Soopers", @cart.name
  end

  def test_it_has_a_capacity
    assert_equal "30items", @cart.capacity
  end

  def test_it_has_no_products_by_default
    assert_equal [], @cart.products
  end

  def test_it_can_add_products
    @cart.add_product(@product1)
    @cart.add_product(@product2)

    assert_equal [@product1, @product2], @cart.products
  end

  def test_it_can_give_cart_details
    result = {name: "King Soopers", capacity: 30}
    assert_equal result, @cart.details
  end
  
  def test_it_can_calculate_the_number_of_products
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)

    assert_equal 13, @cart.total_number_of_products
  end

  def test_it_can_check_if_cart_is_full
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)

    assert_equal true, @cart.is_full?
    assert_equal 33, @cart.total_number_of_products
  end
  
  def test_it_can_find_products_by_category
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)

    assert_equal [@product1, @product3], @cart.products_by_category(:paper)
  end

  def test_it_can_calculate_the_percentage_occupied
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)

    assert_equal 43.33, @cart.percentage_occupied
  end

  def test_it_can_sort_products_by_quantity
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)

    result = [@product4, @product3, @product2, @product1]
    assert_equal result, @cart.sorted_products_by_quantity
  end

  def test_it_can_breakdown_products
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)

    result = {:meat => [@product2], :paper => [@product1, @product3], :produce => [@product4]}
    assert_equal result, @cart.product_breakdown
  end
end