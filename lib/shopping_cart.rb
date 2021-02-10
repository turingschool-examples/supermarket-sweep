require './lib/product'

class Shopping_cart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = self.make_number(capacity)
    @products = []
  end

  def make_number(capacity)
    capacity.delete_suffix("items").to_i
  end


  def add_product(product)
    @products.append(product)
  end

end
