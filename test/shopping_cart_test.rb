require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
  #Iteration2
def test_it_exists
  cart = ShoppingCart.new("King Soopers", "30items")
  assert_instance_of ShoppingCart, cart
end

def test_it_has_a_cart_method
  cart = ShoppingCart.new("King Soopers", "30items")
  assert_equal 'King Soopers', cart.name
end

def test_it_has_a_capacity_method
  skip
  cart = ShoppingCart.new("King Soopers", "30items")
  assert_equal 30, cart.capacity
end

def test_it_has_a_products_method
  cart = ShoppingCart.new("King Soopers", "30items")
  assert_equal [], cart.products
end

def test_it_has_add_product_method
  cart = ShoppingCart.new("King Soopers", "30items")
  assert_equal [], cart.products
end

def test_it_has_a_add_products_method
  cart = ShoppingCart.new("King Soopers", "30items")
  product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
  product2 = Product.new(:meat, 'chicken', 4.50, '2')
  cart.add_product(product1)
  cart.add_product(product2)
  assert_equal [product1,product2], cart.products
end

def test_it_has_details_method
  skip
  cart = ShoppingCart.new("King Soopers", "30items")
  expected = {name: "King Soopers", capacity: 30}, cart.details
  assert_equal expected, cart.details
end
# #   #Iteration3
def test_total_number_of_products
  # skip
   cart = ShoppingCart.new("King Soopers", "30items")
   product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
   product2 = Product.new(:meat, 'chicken', 4.50, '2')
   product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
   cart.add_product(product1)
   cart.add_product(product2)
   cart.add_product(product3)
   assert_equal 13, cart.total_number_of_products
end
end
