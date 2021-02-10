class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity[0..1].to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    hash = {name: name, capacity: capacity }
  end

  def total_number_of_products
    products.reduce(0) { |memo, product| memo += product.quantity }
  end

  def is_full?
    total_number_of_products < capacity ? false : true
  end

  def products_by_category(category)
    product_breakdown[category]
  end

  def percentage_occupied
    current_total_items = products.reduce(0) { |memo, product| memo += product.quantity }
    ratio = current_total_items / capacity.to_f * 100
    ratio.round(2)
  end

  def sorted_product_by_quantity
    products.sort_by(&:quantity)
  end

  def product_breakdown
    products.sort_by(&:category).group_by {|product| product.category }
  end

  ### extra random stuff

  def total_price
    products.reduce(0) { |memo, product| memo += product.unit_price * product.quantity }
  end
end
