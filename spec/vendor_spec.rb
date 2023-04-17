require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @item1  = Item.new({name: 'Peach', price: "$0.75"})
    @item2  = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@vendor).to be_a(Vendor)
    end
  end

  describe '#reads attributes' do
    it 'reads item attributes' do

      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end
  end
  
  describe '#checks stock of item' do
    it 'checks stock of an item' do
      expect(@vendor.inventory).to eq({})
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
  end

  describe 'stocks an item into inventory' do
    it 'stocks and item' do

      @vendor.stock(@item1, 30)
      expect(@vendor.inventory).to eq(@vendor.inventory)
      expect(@vendor.check_stock(@item1)).to eq(30)

      @vendor.stock(@item1, 25)

      expect(@vendor.check_stock(@item1)).to eq(55)

      @vendor.stock(@item2, 12)

      expect(@vendor.inventory).to eq(@vendor.inventory)
    end
  end
end