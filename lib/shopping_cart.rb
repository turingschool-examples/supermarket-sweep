class ShoppingCart
  attr_reader :name,
              :capacity,
              :products
  
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {name: "#{name}", capacity: capacity_to_number}
  end

  def capacity_to_number
    @capacity.delete('items').to_i
  end

  def total_number_of_products
    total_sum = 0
    @products.each do |product|
      total_sum += product.quantity
    end
    total_sum
  end

  def is_full?
    if capacity_to_number > total_number_of_products
      false
    else
      true
    end
  end

end