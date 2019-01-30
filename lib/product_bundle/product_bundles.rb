##
# ProductBundles
#
# Include bundle functionality to product
#
module ProductBundles
  ##
  # Add bundle to the product
  #
  # +bundle_price+:: BundlePrice object
  #
  # returns self
  #
  def add_bundle(bundle_price)
    @bundles ||= [] # set to array if not set
    @bundles.push(bundle_price)
    self
  end

  ##
  # Return array of BundlePrice objects
  #
  def bundles
    @bundles
  end

  ##
  # Produce an array of bundle amounts (product amounts)
  # e.g.
  # bundle 1 - 10 roses
  # bundle 2 - 5 tulips
  # return [10,5]
  #
  # return array of integers
  #
  def bundle_amounts
    @bundles.reduce([]) { |res, cur| res.push(cur.size) }
  end
end
