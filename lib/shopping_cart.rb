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
end
