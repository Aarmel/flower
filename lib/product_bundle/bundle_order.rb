##
# BundleOrder
#
# Specific bundle order
#
class BundleOrder
  attr_accessor :total_products, :product, :bundle_breakdown

  ##
  # Process a bundle order and print report
  # Uses BundleBreakdown utility to determine minimal number of bundles for the number of products requested
  #
  def report
    bundle_breakdown = BundleBreakdown.new(product.bundle_amounts).minimal_number_of_bundles(total_products)
    total_price = 0

    bundle_lines = ''
    product.bundles.each do |bundle|
      next unless bundle_breakdown['sizes'].key?(bundle.size)

      _bundle_size, number_of_bundles = bundle_breakdown['sizes'].select { |size, _number_of_bundles| size == bundle.size }.first
      total_price += bundle.price.to_d * number_of_bundles.to_d
      bundle_lines.concat("     #{number_of_bundles} x #{bundle.size} $#{bundle.price}\n")
    end

    puts "#{total_products} #{product.code} $#{total_price.to_f}\n#{bundle_lines}"
  end
end
