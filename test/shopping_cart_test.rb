require './lib/product'
require './lib/shopping_cart'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
class ShoppingTest < Minitest::Test
  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    @cart.add_product(@product1)
    @cart.add_product(@product2)
  end
  def test_it_exists
    assert_instance_of ShoppingCart, @cart
  end
  def test_it_has_name

    assert_equal @cart.name, 'King Soopers'
  end
  def test_it_has_capacity
    @cart.change_capacity_to_int
    assert_equal @cart.capacity, 30
  end
  def test_can_add_products
    assert_equal @cart.products, [@product1, @product2]
  end
  def test_has_correct_details
    @cart.change_capacity_to_int
    @cart.find_details
    assert_equal @cart.details, {name: "King Soopers", capacity: 30}
  end

  def test_total_number_of_products_correct
    @cart.add_product(@product3)
    assert_equal @cart.total_number_of_products, 13
  end

  def test_cart_is_full

    refute @cart.is_full?

    product4 = Product.new(:produce, 'apples', 0.99, '20')
    @cart.add_product(product4)

    assert @cart.is_full?
  end

  def test_products_by_category
    @cart.add_product(@product3)
    assert_equal @cart.products_by_category(:paper), [@product1, @product3]
  end

  def test_percentage_occupied
    @cart.add_product(@product3)
    assert_equal @cart.percentage_occupied, 43.33
  end
  
  def test_sorted_products_by_quantity
    @cart.add_product(@product3)
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    @cart.add_product(product4)

    assert_equal @cart.sorted_products_by_quantity, [@product3, @product2, @product1, product4]
  end

  def test_product_breakdown
    @cart.add_product(@product3)
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    @cart.add_product(product4)
    binding.pry
    assert_equal @cart.product_breakdown, {:meat => [@product2], :paper => [@product1,@product3], :produce => [product4]}
  end
end