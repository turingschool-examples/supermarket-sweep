class ShoppingCart
  attr_reader :name, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def capacity
    capacity_to_integer = @capacity.delete("items").to_i
  end

  def add_product(product)
    @products << product
  end

  def details
    {name: "#{@name}", capacity: capacity}
  end

  def total_number_of_products
    sum_of_products = 0
    @products.each do |product|
      sum_of_products += product.quantity
    end
    sum_of_products
  end

  def is_full?
    capacity_checker
  end

  def capacity_checker
    if capacity > total_number_of_products
      false
    else
      true
    end
  end

  def products_by_category(category_symbol)
    @products.find_all {|product| product.category == category_symbol}
  end

  def percentage_occupied
    results = ( (total_number_of_products.fdiv capacity) * 100).round(2)
  end

end
