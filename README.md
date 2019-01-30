## Data
Contains the orders
data/bundle_orders

Product data, is hardcoded into the main script

## Usage
ruby bin/flower_power.rb

## specs
Run from the main directory
rspec

## Notes
No validation of inputs
No parser for reading in product data
Will not handle invalid bundle combination
Does not throw any exceptions at the moment

Objects
* ProductInterface
* Flower < ProductInterface
* SaleCatalogue
* ProductBundles (module)
* BundlePrice
* BundleOrder
* BundleBreakdown
