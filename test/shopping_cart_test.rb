require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'


class ShoppingCartTest < Minitest::Test
  # Iteration 2
  def test_it_exists
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_instance_of ShoppingCart, cart
  end

  def test_it_has_a_name
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal cart.name, "King Soopers"
  end

  def test_it_has_a_capacity
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal cart.capacity, 30
  end

  def test_it_starts_with_no_products
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal cart.products, []
  end

  def test_products_can_be_added
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal cart.products, [product1, product2]
  end

  def test_cart_details
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal cart.details, {name: "King Soopers", capacity: 30}
  end

  # Iteration 3
  def test_total_number_of_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal cart.total_number_of_products, 13
  end

  def test_cart_is_full
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal cart.is_full?, false

    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product4)

    assert_equal cart.is_full?, true
  end

  def test_sorting_products_by_category
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal cart.products_by_category(:paper), [product1, product3]
  end

  # Iteration 4
  def test_percentage_occupied
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal cart.percentage_occupied, 43.33
  end

  def test_sorting_products_by_quantity
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    assert_equal cart.sorted_products_by_quantity, [product3, product2, product1, product4]
  end

  def test_cart_breakdown
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    assert_equal cart.product_breakdown, {:meat=>[product2], :paper=>[product1, product3], :produce=>[product4]}
  end
end
