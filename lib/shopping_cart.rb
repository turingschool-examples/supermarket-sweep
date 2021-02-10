class ShoppingCart

  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.slice(/\d+/).to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
      details_hash = {
        :name => '',
        :capacity => ''
      }
      hash.map do |name, capacity|
        hash[:name] = @name
        hash[:capacity] = @capacity
      end
    end

  def total_number_of_products
    total_products = 0
    @products.each do |product|
      total_products += product.quantity
    end
      total_products
  end

  def is_full?

    if total_number_of_products > @capacity
      true
    else
      false
    end

  end

  def products_by_category(category)
    @products.select { |product| product.category == category }
  end

end
