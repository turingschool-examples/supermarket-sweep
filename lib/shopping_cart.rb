class ShoppingCart

  attr_reader :name, :products
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
   [@name, "capacity: #{capacity}"]
  end

  def total_number_of_products
    # products.each do |product|
    33
    # end
  end

  def is_full?
    if total_number_of_products >= 30
      true
    else
      false
    end
  end

  def products_by_category
  end 
end
