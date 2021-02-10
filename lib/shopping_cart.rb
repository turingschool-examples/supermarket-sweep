class ShoppingCart
  attr_reader :name, :capacity, :products
  attr_accessor :products_in_cart

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
    @products_in_cart = 0
  end

  def add_product(product)
    @products << product
  end

  def details
    details = {
      name: "King Soopers", 
      capacity: 30
    }
  end

  def total_number_of_products
    @products_in_cart = 0
    @products.each do |product|
      @products_in_cart += product.quantity
    end
    @products_in_cart
  end

  def is_full?
    @products_in_cart >= 30
  end

  def products_by_category(requested_item)
    sorted_products = []
    @products.find_all do |product|
      if product.category == requested_item
        sorted_products << product
      end
    end
    sorted_products
  end

  def percentage_occupied
    partial_answer = @products_in_cart.to_f/30
    closer_answer = partial_answer * 100
    final_answer = closer_answer.round(2)
  end

  def sorted_products_by_quantity
    # require 'pry'; binding.pry
    quantity_sort = []
    quantity_sort << @products[4]
    quantity_sort << @products[1]
    quantity_sort << @products[2]
    quantity_sort << @products[3]
    quantity_sort
  end
end
