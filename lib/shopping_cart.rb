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
    products.group_by { |product| product.category }[category]
  end

end
