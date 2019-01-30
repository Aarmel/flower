##
# BundlePrice
#
# Value object that, contains size and price of a bundle.
#
class BundlePrice
  attr_reader :size, :price

  ##
  # Params:
  # +size+:: the number of products in the bundle, integer
  # +price+:: Cost of bundle decimal
  #
  def initialize(size, price)
    @size = size
    @price = price
  end

  ##
  # comparison operator to allow comparing two bundles
  #
  def ==(other)
    size == other.size && price == other.price
  end
end
