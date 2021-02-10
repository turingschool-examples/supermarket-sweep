class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product
  end

  # def details
  #   [apple, 1, banana, 2]
  #
  # {apple => 1, banana => 2}
  #
  #   h3 = Hash[a3.map {|key, value| [key, value]}]
  #   puts "h3: #{h3.inspect}"
  #
  #   h3: {["orange", "seedless"]=>3, "apple"=>1, "banana"=>2}
  #
  # end

  def total_number_of_products
    total_products = 0
    @products.each do |product|
      total_products += product.quantity
    end
      total_products
  end

  def is_full?
    if @cart.total_number_of_products > @cart.capacity.split(/\D+/).to_i
      true
    else
      false
    end
  end

  def products_by_category(category)
    @products.select { |product| product.category == category }
  end

end
