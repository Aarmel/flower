require './lib/product_bundle/product_bundles'
require './lib/product_bundle/bundle_price'
require './lib/product_interface'

##
# Flower
#
# Represents flower product, name and code.
# extended to use product bundles
#
class Flower < ProductInterface
  include ProductBundles
  attr_accessor :name, :code

  ##
  # Adds product to catalog
  #
  # +name+:: string, name of flower
  # +code+:: string, product code uid
  #
  def initialize(name, code)
    @name = name
    @code = code
  end
end
