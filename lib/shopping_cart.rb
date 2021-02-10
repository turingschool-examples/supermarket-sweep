class ShoppingCart
  attr_reader :products, :name, :capacity, :details, :total_in_cart

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
    @total_in_cart = 0
  end

  def add_product(product_added)
    @products << product_added
  end

  def details
    @details = Hash.new
    @details[:name] = @name
    @details[:capacity] = @capacity[0..1].to_i
    @details
  end

  def total_number_of_products
    @products.each do |product|
      @total_in_cart += product.quantity
    end
    @total_in_cart
  end

  def is_full?
    total_number_of_products
    @total_in_cart > @capacity[0..1].to_i
  end

  def products_by_category(category_type)
    return @sorted_products = @products.select {|product| product.category == category_type}
  end

  def percentage_occupied
    total_number_of_products
    (100*@total_in_cart / @capacity[0..1].to_f).round(2)
  end

end
