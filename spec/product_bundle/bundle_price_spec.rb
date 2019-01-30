require 'spec_helper'
require 'product_bundle/bundle_price'

RSpec.describe 'BundlePrice' do
  subject(:bundle_price) { BundlePrice.new(1, 2.30) }

  it 'has been instantiated' do
    expect(bundle_price).to be_an(BundlePrice)
  end

  context 'initial state' do
    it 'size (1), price(2.30) are set' do
      expect(bundle_price.size).to eq(1)
      expect(bundle_price.price).to eq(2.30)
    end
  end

  describe '==' do
    let(:rose) { BundlePrice.new(1, 2.30) }
    let(:tulip) { BundlePrice.new(1, 2.30) }
    let(:calendula) { BundlePrice.new(1, 3.30) }
    let(:marigold) { BundlePrice.new(2, 2.30) }

    it 'returns true when two BundlePrice objects have the same values' do
      expect(rose==tulip).to eq(true)
    end

    it 'returns false when two BundlePrice objects have different values' do
      expect(rose==calendula).to eq(false)
      expect(rose==marigold).to eq(false)
    end
  end
end
