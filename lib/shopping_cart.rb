class ShoppingCart

  attr_reader :name, :capacity, :products, :details

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
    @details = Hash.new(0)
  end

  def change_capacity_to_int
    @capacity = @capacity.to_i
  end

  def add_product(product)
    @products << product
  end

  def find_details
    change_capacity_to_int
    @details[:name] = @name
    @details[:capacity] = @capacity
    @details
  end

  def total_number_of_products
    total_quantity = 0
    @products.map {|product| total_quantity += product.quantity }
    total_quantity
  end

  def is_full?
    if total_number_of_products
      true
    end
  end

  def products_by_category(category)
    @products.find_all {|product| product.category == category}
  end
end