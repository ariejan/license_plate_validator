# License Plate Validator

[![Gem Version](https://badge.fury.io/rb/license_plate_validator.png)](http://badge.fury.io/rb/license_plate_validator)

This gem allows you to easily valdiate license plate fields to be valid
license plates.

We're planning on supporting multiple countries, but at this time we can
only validate Dutch and German license plates.

## Features

Validates Dutch license plates ("kentekens"), includes all ten common Dutch license
plate types. 

Special license plates (like those for the Royal family) are not supported.

Also supports most german license plates, including most diplomatic formats.

## Installation

Add this line to your application's Gemfile:

    gem 'license_plate_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install license_plate_validator

## Usage

    LicensePlateValidator.new("60-NFH-1", country: :nl).valid?
    #=> true

    LicensePlateValidator.new("SBA 5226", country: :nl).valid?
    #=> false

### Ruby on Rails support

You can use LicensePlateValidator with any ActiveModel class, including 
ActiveRecord models:

    class Vehicle < ActiveRecord::Base
      validates :license_plate_number, license_plate: { country: :nl }
    end

### Dynamic country selection

If you supply a `Proc` it will be called with the current record begin validated.

The `Proc` must return either `nil` (accept all the things) or a valid country code.

    class Vehicle < ActiveRecord::Base
      validates :license_plate_number,
        license_plate: { country: Proc.new { |vehicle| vehicle.country } }
    end

### Edge cases

 * When no country is selected (or set to `nil`), all plates are considered valid.
 * When an unknown country is selected, all plates are considered valid (e.g. we assume there are no validation rules for that country)

### Supported countries

 * `:nl` Netherlands; all common "sidecode" number formats.
 * `:de` Germany; all regular forms as well as the common diplomatic variants

## I18n

Locales for English, Dutch and German are provided. See [`lib/license_plate_validator/locales`](https://github.com/ariejan/license_plate_validator/tree/master/lib/license_plate_validator/locales)
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

## Contributor

 * Pascal Widdershoven - for the original regexes for Dutch license plate numbers.
 * Edward Poot - for adding new RDW approved license plate schemes
 * Marcus Ilgner, evopark - for german license plates

## License

See [LICENSE.txt](https://github.com/ariejan/license_plate_validator/blob/master/LICENSE.txt)
