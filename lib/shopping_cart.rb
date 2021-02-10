class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name     = name
    @capacity = capacity.delete("items").to_i
    @products = []
  end

  def add_product(item_name)
    @products << item_name
  end

  def details
    {
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
    if total_number_of_products > quantity
      true
    else
      false
    end
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end


end
