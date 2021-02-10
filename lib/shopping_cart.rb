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
  #
  #
  #
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

end
