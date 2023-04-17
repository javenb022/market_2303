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
    @vendors.flat_map do |vendor|
      vendor.inventory.map do |item|
        sorted_list << item[0].name
      end
    end
    sorted_list.uniq.sort
  end
end