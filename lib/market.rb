class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def sorted_item_list
    sorted_list = []
    @vendors.map do |vendor|
      vendor.inventory.map do |item|
        sorted_list << item[0].name
      end
    end
    sorted_list.uniq.sort
  end


  def total_inventory
    item_quantities = Hash.new(0)
    @vendors.map do |vendor|
      vendor.inventory.map do |item|
        item_quantities[item[0]] = {:quantity => 0, :vendors => []}
      end
    end
    item_quantity = 0
    @vendors.map do |vendor|
      vendor.inventory.map do |item|
        item_quantity += vendor.check_stock(item[0])
        item_quantities[item[0]][:quantity] += item_quantity
      end
    end
    @vendors.map do |vendor|
      vendor.inventory.map do |item|
        item_quantities[item[0]][:vendors] << vendor
      end
    end
    require 'pry'; binding.pry
    item_quantities
  end
end