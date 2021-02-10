require 'minitest/autorun'
require 'minitest/pride'
require './lib/shopping_cart'
require './lib/product'

class ShoppingCartTest < Minitest::Test
  def test_it_exists
    # skip
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_instance_of ShoppingCart, cart
  end

  def test_it_has_attributes
    # skip
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal "King Soopers", cart.name
  end

  def test_it_can_have_different_attributes
    skip
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal 30, cart.capacity
  end

  def test_it_can_have_different_attributes
    # skip
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal [], cart.products
  end

  def test_it_can_add_products
    # skip
    product1 = Product.new(:paper, "toilet paper", 3.70, "10")
    product2 = Product.new(:meat, "chicken", 4.50, "2")
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal [product1, product2], cart.products
  end

  def test_it_can_see_cart_details
    # skip
    product1 = Product.new(:paper, "toilet paper", 3.70, "10")
    product2 = Product.new(:meat, "chicken", 4.50, "2")
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal Hash[:name, "King Soopers", :capacity, 30], cart.details
  end

  def test_it_can_add_products_quantities
    # skip
    product1 = Product.new(:paper, "toilet paper", 3.70, "10")
    product2 = Product.new(:meat, "chicken", 4.50, "2")
    product3 = Product.new(:paper, "tissue paper", 1.25, "1")
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 13, cart.total_number_of_products
  end

  def test_it_can_determine_if_cart_full_when_not
    # skip
    product1 = Product.new(:paper, "toilet paper", 3.70, "10")
    product2 = Product.new(:meat, "chicken", 4.50, "2")
    product3 = Product.new(:paper, "tissue paper", 1.25, "1")
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    refute cart.is_full?
  end

  def test_it_can_determine_if_cart_full
    # skip
    product1 = Product.new(:paper, "toilet paper", 3.70, "10")
    product2 = Product.new(:meat, "chicken", 4.50, "2")
    product3 = Product.new(:paper, "tissue paper", 1.25, "1")
    product4 = Product.new(:product, "apples", 0.99, "20")
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    assert_equal true, cart.is_full?
  end


end
