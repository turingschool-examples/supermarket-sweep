class Product

  attr_reader :category,
              :name,
              :unit_price,
              :quantity


  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
  end

  def total_price #refactor greatly if time
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    if product1
      return (product1.unit_price * product1.quantity) if product1
    elsif product2
      return product2.unit_price * product2.quantity if product2
    end
  end

  def hoard
    product = Product.new(:paper, 'toilet paper', 3.70, '10')
    product.quantity + 1
  end

  def is_hoarded?
    product = Product.new(:paper, 'toilet paper', 3.70, '10')
    if product.quantity >= 2
      true
    end
  end


end
