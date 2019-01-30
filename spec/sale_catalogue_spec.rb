require 'spec_helper'
require 'sale_catalogue'
require 'flower'

RSpec.describe 'SaleCatalogue' do
  subject(:sale_catalogue) { SaleCatalogue.new }

  it 'has been instantiated' do
    expect(sale_catalogue).to be_an(SaleCatalogue)
  end

  context 'initial state' do
    it 'has no products' do
      expect(sale_catalogue.products).to eq({})
    end
  end

  describe '.add(product)' do
    let(:roses) { Flower.new('Roses', 'R12')}

    before {
      sale_catalogue.add(roses)
    }

    it 'has products' do
      expect(sale_catalogue.products.size).to eq(1)
    end
  end

  describe '.find(code)' do
    let(:roses) { Flower.new('Roses', 'R12')}

    before {
      sale_catalogue.add(roses)
    }

    it 'returns product with matching code' do
      expect(sale_catalogue.find('R12').name).to eq(roses.name)
    end
  end
end
