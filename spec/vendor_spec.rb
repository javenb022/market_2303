require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  describe '#initialize' do
    it 'exists' do

      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
      expect(@vendor).to be_a(Vendor)
    end
  end
end