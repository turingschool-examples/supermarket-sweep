class ShoppingCart
  attr_reader :name,
              :capacity,
              :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.slice(0,2).to_i
    @products = []
    @shopping_cart_quantity = 0
  end
  def add_product(product)
    @products << product
    #@shopping_cart_quantity += product.quantity

  end
  def details
    {name: @name, capacity: @capacity}
  end
  # def is_full?
  #   @shopping_cart_quantity >= @capacity
  # end
  def products_by_category(category)
      product_category = []

      products.each do |product|
        if product.category == category
          product_category << product
        end
      end
      product_category
    end
end
