class ShoppingCart
  attr_reader :name, :capacity, :products
  def initialize(name,capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    (products[0].quantity.to_i)+(products[1].quantity.to_i)+(products[2].quantity.to_i)
  end

  def products_by_category(category)
      product_category = []
      products.each do  |product|
        if product.category == category
         product_category << product
        end
      end
      product_category
  end
end 
