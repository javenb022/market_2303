class Vendor
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def stock(product, amount)
    @inventory[product] += amount
  end

  def potential_revenue
    @inventory.map do |item| 
      item[0].price * inventory[item[0]]
    end.sum
  end
end