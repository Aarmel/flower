# module ProductBundles
#   def add_bundle(bundle_price)
#     @bundles ||= [] # set to array if not set
#     @bundles.push(bundle_price)
#     self
#   end
#
#   def bundles
#     @bundles
#   end
#
#   def bundle_amounts
#     @bundles.reduce([]) { |res, cur| res.push(cur.size)}
#   end
# end
require 'spec_helper'
require 'product_bundle/product_bundles'

RSpec.describe 'ProductBundles' do
  let(:object) { klass.new }
  let(:klass) do
    Class.new do
      include ProductBundles
    end
  end

  describe '.add_bundle(bundle_price)' do
    it 'adds bundle price to bundles list' do

    end
  end

  describe '.bundles' do
    let(:rose) { BundlePrice.new(1, 2.30) }

    it 'returns current list of bundles only after bundle has been added' do
      expect(object.bundles).to eq(nil)
      object.add_bundle(rose)
      expect(object.bundles.size).to eq(1)
    end
  end

  describe '.bundle_amounts' do
    before {
      object.add_bundle(BundlePrice.new(1, 12.30))
      object.add_bundle(BundlePrice.new(8, 2.60))
      object.add_bundle(BundlePrice.new(5, 4.30))
      object.add_bundle(BundlePrice.new(6, 3.30))
    }
    it 'returns array of numbers, number of products in each bundle' do
      expect(object.bundle_amounts).to eq([1,8,5,6])
    end
  end
end
