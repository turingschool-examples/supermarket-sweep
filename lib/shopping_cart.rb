class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity[0..1].to_i
    @products = []
  end

  # puts a product inside of the cart
  # product -> array of products
  def add_product(product)
    @products << product
  end

  # tells you what the cart's name is and what the cart's total capacity is
  # no argument -> hash
  def details
    {name: name, capacity: capacity }
  end

  # tells you the total # of products within a cart
  # no argument -> integer
  def total_number_of_products
    products.reduce(0) { |memo, product| memo += product.quantity }
  end

  # tells you whether the cart is full or not
  # no argument -> boolean
  def is_full?
    total_number_of_products < capacity ? false : true
  end

  # returns an array of all products of a category
  # category -> array of products in that category
  def products_by_category(category)
    product_breakdown[category]
  end

  # returns the % of the cart that is occupied
  # no argument -> float of % occupied
  def percentage_occupied
    ratio = total_number_of_products / capacity.to_f * 100
    ratio.round(2)
  end

  # sorts the products by their quantity
  # no argument -> array of products sorted by quantity
  def sorted_product_by_quantity
    products.sort_by(&:quantity)
  end

  # returns a hash of all the producted sorted by their category in alphabetical order
  # no argument -> hash of alphabetically & catagorically sorted products
  def product_breakdown
    products.sort_by(&:category).group_by {|product| product.category }
  end

  ### extra random stuff

  # returns the total price of all items inside of the cart
  # no argument -> float
  def total_price
    products.reduce(0) { |memo, product| memo += product.total_price }
  end
end
