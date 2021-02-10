class ShoppingCart
  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def capacity
    without_letters = 0
    @capacity.each do |letter|
      without_letters << capacity.delete("items").to_i
    end
    without_letters
  end

  def details
    trip = {}
    @capactiy.each do |trip|
      trip[cart.name] << cart.capacity
    end
    trip
  end

  def total_number_of_products
      <<

end
