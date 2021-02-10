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
    change_capacity_to_int
    if total_number_of_products >= @capacity
      true
    else
      false
    end
  end

  def products_by_category(category)
    @products.find_all {|product| product.category == category}
  end

  def percentage_occupied
    (total_number_of_products.to_f / change_capacity_to_int).round(4) * 100
  end

  def sorted_products_by_quantity
    @products.sort_by {|product| product.quantity}
  end

  def product_breakdown
    breakdown_hash = Hash.new(0)
    @products.map { 
      |product| 
      p breakdown_hash[product.category] != 0
      if breakdown_hash[product.category] != 0
        breakdown_hash[product.category].append(product)
      else
        breakdown_hash[product.category] = [product]
      end
    }
    breakdown_hash
  end
end