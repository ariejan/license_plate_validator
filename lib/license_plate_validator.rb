class LicensePlateValidator

  PATTERNS = [
    # Netherlands
    /^([a-zA-Z]{2})-?([0-9]{2})-?([0-9]{2})$/,
    /^([0-9]{2})-?([0-9]{2})-?([a-zA-Z]{2})$/,
    /^([0-9]{2})-?([a-zA-Z]{2})-?([0-9]{2})$/,
    /^([a-zA-Z]{2})-?([0-9]{2})-?([a-zA-Z]{2})$/,
    /^([a-zA-Z]{2})-?([a-zA-Z]{2})-?([0-9]{2})$/,
    /^([0-9]{2})-?([a-zA-Z]{2})-?([a-zA-Z]{2})$/,
    /^([0-9]{2})-?([a-zA-Z]{3})-?([0-9]{1})$/,
    /^([0-9]{1})-?([a-zA-Z]{3})-?([0-9]{2})$/,
    /^([a-zA-Z]{2})-?([0-9]{3})-?([a-zA-Z]{1})$/,
    /^([a-zA-Z]{1})-?([0-9]{3})-?([a-zA-Z]{2})$/
  ].freeze

  def initialize(raw)
    @raw = normalize(raw || "")
  end

  attr_reader :raw

  def valid?
    PATTERNS.any? { |pattern| raw =~ pattern }
  end

  def to_s
    raw
  end

  private

  def normalize(input)
    input.to_s.upcase.strip.gsub(/[^A-Z0-9]/, '')
  end
end

require 'license_plate_validator/version'
require 'license_plate_validator/active_model' if defined?(ActiveModel)
