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
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal 30, cart.capacity
  end

  def test_it_has_empty_products
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal [], cart.products
  end

  def test_add_product
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)

    cart.products

    assert_equal [product1, product2], cart.products
  end

  def test_cart_details
    cart = ShoppingCart.new("King Soopers", "30items")
    expected = {name: "King Soopers", capacity: 30}

    assert_equal expected, cart.details
  end

  def test_total_number_of_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 13, cart.total_number_of_products
  end

  def test_is_full?
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal false, cart.is_full?

    cart.add_product(product4)

    assert_equal true, cart.is_full?
  end


  def test_products_by_category
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    assert_equal [product1, product3], cart.products_by_category(:paper)
  end

  def test_percentage_occupied
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 43.33, cart.percentage_occupied
  end

  def test_sorted_products_by_quantity
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    assert_equal [product3, product2, product1, product4], cart.sorted_products_by_quantity
  end

  def test_product_breakdown
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    expected = {:meat => [product2], :paper => [product1, product3], :produce => [product4]}

    assert_equal expected, cart.product_breakdown
  end
end
