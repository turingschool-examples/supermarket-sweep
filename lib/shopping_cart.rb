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
    detail_hash = {name: @name, capacity: @capacity}
  end

  def total_number_of_products
    @total_quantity = 0
    @products.each do |product|
      @total_quantity += product.quantity
    end
      @total_quantity
  end

  def is_full?
    total_number_of_products
    if @total_quantity < @capacity
      false
    else
      true
    end
  end

  def products_by_category(category)
    @products.find_all do |product|
    product.category == category
    end
  end

  def percentage_occupied
    total_number_of_products
    percentage = (@total_quantity.to_f / @capacity) * 100
    percentage.round(2)
  end

  def sorted_products_by_quantity
    @products.sort_by do |product|
      product.quantity
    end
  end

  def product_breakdown
    categories = []
    breakdown = Hash.new
    @products.each do |product|
      if !(categories).include?(product.category)
        categories << product.category
      end
    end

    categories.each do |category|
      category_products = products_by_category(category)
      breakdown[category] = category_products
    end
    return breakdown
  end
end
