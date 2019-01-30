require 'spec_helper'
require 'flower'

RSpec.describe 'Flower' do
  subject(:flower) { Flower.new('Roses', 'R12') }

  it 'has been instantiated' do
    expect(flower).to be_an(Flower)
  end

  context 'initial state' do
    it 'name (Roses), code(R12) are set' do
      expect(flower.name).to eq('Roses')
      expect(flower.code).to eq('R12')
    end
  end
end
