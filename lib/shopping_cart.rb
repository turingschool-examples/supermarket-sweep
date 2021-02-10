require './lib/product'
class ShoppingCart

  attr_reader :name, :capacity, :products, :product, :quantity

  #attr_accessor :product, :quantity

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product

  end

  def details
    @details = {"name": name, "capacity": capacity}
  end

  def total_number_of_products
     total_number_of_products = 0
     @products.each do |product|
       @product.each do |quantity|
         total_number_of_products += product.quantity
       end
     end


    # @products.find_all do |product|
    #   total_number_of_products = 0
    #   if @quantity.to_i > 0
    #     total_number_of_products += @quantity.to_i
    #   end
    #   return total_number_of_products
    # end
  end

  def is_full?
    if @cart.total_number_of_products >= @capacity
      true
    else
      false
    end
  end




end
