## Data
Contains the orders<br/>
data/bundle_orders<br/>

Product data, is hardcoded into the main script<br/>

## Usage
ruby bin/flower_power.rb<br/>

## specs
Run from the main directory<br/>
rspec

## Notes
No validation of inputs<br/>
No parser for reading in product data<br/>
Will not handle invalid bundle combination<br/>
Does not throw any exceptions at the moment<br/>

### Objects
* ProductInterface
* Flower < ProductInterface
* SaleCatalogue
* ProductBundles (module)
* BundlePrice
* BundleOrder
* BundleBreakdown
