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

  def total_number_of_products
    total_quantitiy = 0
    @products.each do |product|
      total_quantitiy += product.quantity
    end
    total_quantitiy
  end

  def is_full?
    if total_number_of_products > @capacity
      true
    else
      false
    end
  end

  def produce_by_category(type)
    list_of_type = []
    @products.each do |item|
      if item.category == type
        list_of_type.append(item)
      end
    end
    list_of_type
  end

end
