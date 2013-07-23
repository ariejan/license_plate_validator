# License Plate Validator

[![Gem Version](https://badge.fury.io/rb/license_plate_validator.png)](http://badge.fury.io/rb/license_plate_validator)
[![Build Status](https://travis-ci.org/ariejan/license_plate_validator.png?branch=master)](https://travis-ci.org/ariejan/license_plate_validator)

This gem allows you to easily valdiate license plate fields to be valid
license plates.

We're planning on supporting multiple countries, but at this time we can
only validate Dutch license plates.

## Features

Validate Dutch license plates ("kentekens"), includes all ten common Dutch license
plate types. 

Special license plates (like those for the Royal family) are not supported.

## Installation

Add this line to your application's Gemfile:

    gem 'license_plate_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install license_plate_validator

## Usage

Without ActiveModel or Rails:

    LicensePlateValidator.new("60-NFH-1").valid?
    #=> true

Or add it to your Rails 3.x or 4.x project, using ActiveModel:

    class Vehicle < ActiveRecord::Base
      validates :license_plate_number, license_plate: true
    end

## I18n

Locales for English and Dutch are provided. See [`lib/license_plate_validator/locales`](https://github.com/ariejan/license_plate_validator/tree/master/lib/license_plate_validator/locales)
for details.

## Contributing

### Wishlist

I'd like to add the following feature (in no specific order), maybe you can help?

 * Validate uncommon license plates as well (like CD-dd-dd and AA-dd)
 * Check if characters used are actually allowed.
 * Output properly formatted license plate numbers
 * Add support for other countries where possible. Germany, Belgium, France and Poland are high on the list.

If you're unsure what to contribute, contact me. :-)

### How to contribute

I prefer a pull request with added, but failing, specs to code without
specs.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See [LICENSE.txt](https://github.com/ariejan/license_plate_validator/blob/master/LICENSE.txt)
