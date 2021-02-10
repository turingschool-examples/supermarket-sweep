class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def capacity
    @capacity.to_i
  end

  def add_product(product)
    @products << product
  end

  def details
    details = []
    details << {name: "King Soopers", capacity: 30}
  end

  def total_number_of_products
    total_products = 0
    @products.each do |product|
      total_products << product.count
    end
    total_products
  end
end
