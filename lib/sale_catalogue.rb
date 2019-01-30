##
# SaleCatalogue
#
# Store for products
#
class SaleCatalogue
  attr_accessor :products

  def initialize
    @products = {}
  end

  ##
  # Adds product to catalog
  #
  # +product+:: Product object
  #
  def add(product)
    @products[product.code.to_sym] = product
  end

  ##
  # Find prodcut in catalog
  #
  # +code+:: string (product code)
  #
  def find(code)
    @products[code.to_sym]
  end
end
