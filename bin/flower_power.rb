require 'bigdecimal'
require 'bigdecimal/util' # loads the to_d method

require './lib/flower'
require './lib/sale_catalogue'
require './lib/product_bundle/bundle_breakdown'
require './lib/product_bundle/bundle_order'

catalogue = SaleCatalogue.new

flower = Flower.new('Roses', 'R12')
  .add_bundle(BundlePrice.new(3, 6.99))
  .add_bundle(BundlePrice.new(10, 12.99))
catalogue.add(flower)

flower = Flower.new('Lillies', 'L09')
  .add_bundle(BundlePrice.new(3, 9.95))
  .add_bundle(BundlePrice.new(6, 16.95))
  .add_bundle(BundlePrice.new(9, 24.95))
catalogue.add(flower)

flower = Flower.new('Tulips', 'T58')
  .add_bundle(BundlePrice.new(3, 5.95))
  .add_bundle(BundlePrice.new(5, 9.95))
  .add_bundle(BundlePrice.new(9, 16.99))
catalogue.add(flower)

bundle_order = BundleOrder.new

File.readlines('data/bundle_orders').each do |order|
  order_line = order.split(' ')
  bundle_order.total_products = order_line[0].to_i
  bundle_order.product = catalogue.find(order_line[1].to_sym)
  bundle_order.report
end
