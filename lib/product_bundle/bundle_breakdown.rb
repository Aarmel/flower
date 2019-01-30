##
# BundleBreakdown
#
# Utility to breakdown the number of bundles required.
#
class BundleBreakdown
  attr_accessor :permutations, :results, :product

  ##
  # +bundle_amounts+:: array of integers
  #
  def initialize(bundle_amounts)
    @permutations = bundle_amounts.permutation.to_a
    @results = []
  end

  ##
  # Finds the minimal number of bundles required to get the number_of_products requested
  #
  #
  # +number_of_products+:: integer (number of products wanted)
  #
  # total - total number of bundles, sizes  bundle_size=>number of bundles
  # return {"total"=>5, "sizes"=>{5=>4, 3=>1}}
  #
  def minimal_number_of_bundles(number_of_products)
    # All permutations as order can matter
    # [3,1,9] vs [9,1,3] we can stop at 9, if 9 is the wanted number of products
    # Also 3 would match evenly
    #
    min_bundles = false
    lowest_total = 0 # number of bundles required

    @permutations.each do |values|
      bundle_breakdown = { 'total' => 0, 'sizes' => {} }
      current_want = number_of_products

      # each value in array of permutation [3,1,2]
      values.each do |value|
        div_value = current_want / value
        next if div_value.zero?

        bundle_breakdown['sizes'][value] = div_value
        bundle_breakdown['total'] += div_value

        # Dont keep checking if we are already over our lowest total
        break if bundle_breakdown['total'] > lowest_total && lowest_total != 0

        current_want = current_want % value

        if current_want.zero?
          lowest_total = bundle_breakdown['total']
          min_bundles = bundle_breakdown
          break
        end
      end

      break if lowest_total == 1
    end

    min_bundles
  end
end
