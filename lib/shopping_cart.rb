class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
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
      false
    end
  end
end
