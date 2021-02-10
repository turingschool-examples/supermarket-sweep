class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    details = {
      name: "#{@name}",
      capacity: @capacity
    }
  end

  def total_number_of_products
    total = 0
    products.each do |product|
        total += product.quantity
    end
    return total
  end

  def is_full?
    if @capacity == @products.length
      true
    else
      false
    end
  end

  # def products_by_category(category_name)
  #   @products.each do |product|
  #     if product.category == category_name
  #       @products << product
  #     end
  #   end
  #   @products
  # end

end
