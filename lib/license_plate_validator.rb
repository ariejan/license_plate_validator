class LicensePlateValidator

  PATTERNS = {
    # Netherlands
    NL: [
      /^([A-Z]{2})-?([0-9]{2})-?([0-9]{2})$/i,
      /^([0-9]{2})-?([0-9]{2})-?([A-Z]{2})$/i,
      /^([0-9]{2})-?([A-Z]{2})-?([0-9]{2})$/i,
      /^([A-Z]{2})-?([0-9]{2})-?([A-Z]{2})$/i,
      /^([A-Z]{2})-?([A-Z]{2})-?([0-9]{2})$/i,
      /^([0-9]{2})-?([A-Z]{2})-?([A-Z]{2})$/i,
      /^([0-9]{2})-?([A-Z]{3})-?([0-9]{1})$/i,
      /^([0-9]{1})-?([A-Z]{3})-?([0-9]{2})$/i,
      /^([A-Z]{2})-?([0-9]{3})-?([A-Z]{1})$/i,
      /^([A-Z]{1})-?([0-9]{3})-?([A-Z]{2})$/i
    ],
    # Germany
    D: [
      # expects input to be uppercase
      # allow AB-CD-123 or AB-CD123 (including vowels with umlaut)
      #
      # format, according to http://nl.wikipedia.org/wiki/Duits_kenteken:
      # 1 to 3 letters
      # then 1 or 2 letters - or maybe numbers, for special plates
      # then 1 to 4 numbers
      #
      # current check (we don't need to be that strict, CJIB isn't, CJIB checks presence of 1 or 2 dashes):
      # letters (at least 1), then dash,
      # then letters or numbers (at least 1), then optional dash
      # then letters or numbers (at least 1)
      #
      # lowercase diacritics aren't automatically case insensitive.
      /^[A-ZÄËÖÜäëöü]+-[0-9A-ZÄËÖÜäëöü]+-?[0-9A-ZÄËÖÜäëöü]+$/i,
      # more diplomatic license plates ;)
      /^0-\d{1,3}-\d{1,3}\w?$/i,
    ]
  }.freeze

  def initialize(raw, options = {})
    @options = {
      country: nil
    }.merge(options)

    @raw = raw || ''
  end

  attr_reader :raw

  def valid?
    return true if @options[:country].nil?

    country = @options[:country].upcase.to_sym

    return true unless supported_countries.include?(country)

    PATTERNS[country].any? { |pattern| raw =~ pattern }
  end

  def supported_countries
    PATTERNS.keys
  end

  def patterns_for_country(country)
    return PATTERNS[country] || []
  end

  def to_s
    raw
  end
end

require 'license_plate_validator/version'
require 'license_plate_validator/active_model' if defined?(ActiveModel)
