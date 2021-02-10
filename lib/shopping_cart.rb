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
    {
      name: @name,
      capacity: @capacity
    }
  end

  def total_number_of_products
    total_products = 0

    @products.each do |product|
      total_products += product.quantity
    end

    total_products
  end

  def is_full?
    if total_number_of_products >= @capacity
      true
    else
      false
    end
  end

  def products_by_category(specific_category)
    desired_products = []

    @products.each do |product|
      if product.category == specific_category
        desired_products << product
      end
    end
    desired_products
  end
end
