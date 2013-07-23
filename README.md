# License Plate Validator

This gem allows you to easily valdiate license plate fields to be valid
license plates.

We're planning on supporting multiple countries, but at this time we can
only validate Dutch license plates.

## Installation

Add this line to your application's Gemfile:

    gem 'license_plate_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install license_plate_validator

## Usage

Easy:

    class Vehicle < ActiveRecord::Base
      validates :license_plate_number, license_plate: true
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See [LICENSE.txt](https://github.com/ariejan/license_plate_validator/blob/master/LICENSE.txt)
