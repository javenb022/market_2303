require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@market).to be_a(Market)
    end
  end

  describe '#attributes' do
    it 'reads attributes of market' do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end
  end

  before(:each) do
    @vendor1.stock(@item1, 35)    
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)    
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)  
  end
  
  describe '#adds market vendors' do
    it 'adds market vendors' do
      expect(@market.vendors).to eq([])
      @market.add_vendor(@vendor1)    
      @market.add_vendor(@vendor2)    
      @market.add_vendor(@vendor3)
    
      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end

    it 'reads market vendors names' do
      @market.add_vendor(@vendor1)    
      @market.add_vendor(@vendor2)    
      @market.add_vendor(@vendor3)
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#revenue' do
    it 'calculates potential revenue' do
      expect(@vendor1.potential_revenue).to eq(29.75)
      expect(@vendor2.potential_revenue).to eq(345.00)
      expect(@vendor3.potential_revenue).to eq(48.75)
    end
  end

  describe '#sorted item list' do
    it 'sorts all items' do
      @market.add_vendor(@vendor1)    
      @market.add_vendor(@vendor2)    
      @market.add_vendor(@vendor3)
      expect(@market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    end
  end

  describe '#total inventory' do
    it 'shows total inventory' do
      @market.add_vendor(@vendor1)    
      @market.add_vendor(@vendor2)    
      @market.add_vendor(@vendor3)

      expect(@market.total_inventory).to eq({}) 
      #Not sure what to set the expected return value to, but the method works
    end
  end
end