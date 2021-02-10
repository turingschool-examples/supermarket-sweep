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
    # count = 0
    # @products.each do |product|
    #   product.quantity += 1
    # end
    # count
  end

  def is_full?
    if total_number_of_products > @capacity
      true
    else
      @full
    end
  end

  def percentage_occupied
    (decimal_occ * 100).round(2)
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
