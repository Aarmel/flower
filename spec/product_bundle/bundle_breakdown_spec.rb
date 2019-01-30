require 'spec_helper'
require 'product_bundle/bundle_breakdown'

RSpec.describe 'BundleBreakdown' do
  subject(:bundle_breakdown) { BundleBreakdown.new([3, 6, 9]) }

  it 'has been instantiated' do
    expect(bundle_breakdown).to be_an(BundleBreakdown)
  end

  context 'initial state' do
    it 'product (nil), results ([] empty), permutations ([[3, 6, 9], [3, 9, 6], [6, 3, 9], [6, 9, 3], [9, 3, 6], [9, 6, 3]])' do
      expect(bundle_breakdown.results).to eq([])
      expect(bundle_breakdown.permutations).to eq([[3, 6, 9], [3, 9, 6], [6, 3, 9], [6, 9, 3], [9, 3, 6], [9, 6, 3]])
      expect(bundle_breakdown.product).to eq(nil)
    end
  end

  describe 'minimal_number_of_bundles' do
    it 'returns the minimum number of bundles required' do
      expect(BundleBreakdown.new([5,10]).minimal_number_of_bundles(10)).to eq({"total"=>1, "sizes"=>{10=>1}})
      expect(BundleBreakdown.new([3,6,9]).minimal_number_of_bundles(15)).to eq({"total"=>2, "sizes"=>{9=>1, 6=>1}})
      expect(BundleBreakdown.new([3,5,9]).minimal_number_of_bundles(13)).to eq({"total"=>3, "sizes"=>{5=>2, 3=>1}})
    end
  end
end
