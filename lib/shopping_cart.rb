class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @full = false
  end

  def add_product(product)
    @products << product
  end

  def details
    cart_details = {
      name: @name,
      capacity: @capacity
    }
  end

  def total_number_of_products
    @products.sum do |product|
      product.quantity
    end
  end

  def is_full?
    if total_number_of_products > @capacity
      true
    else
      @full
    end
  end

  def percentage_occupied
    if over_capacity
      "#{percent_over} % Over Capacity"
    else
      capacity_occupied
    end
  end

  def over_capacity
    (decimal_occ.round(2)) > 1.00
  end

  def capacity_occupied
    (decimal_occ * 100).round(2)
  end

  def percent_over
    ((decimal_occ * 100) -100).to_i
  end

  def decimal_occ
    total_number_of_products / @capacity.to_f
  end

  def sorted_products_by_quantity
    @products.sort_by do |product|
      product.quantity
    end.reverse
  end

  def product_breakdown
    @products.group_by do |product|
      product.category
    end
  end
end
