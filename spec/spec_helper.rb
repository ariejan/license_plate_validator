require 'rspec'
begin
  require 'active_model'
rescue LoadError => err
  puts "Running specs without active_model extension"
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'license_plate_validator'

if defined?(ActiveModel)
  class ModelBase
    include ActiveModel::Serialization
    include ActiveModel::Validations

    attr_accessor :attributes

    def initialize(attributes = {})
      @attributes = attributes
    end

    def read_attribute_for_validation(key)
      @attributes[key.to_sym]
    end

    def method_missing(method_name, *args, &block)
      return super unless @attributes.keys.any? { |k| k == method_name }
      @attributes[method_name.to_sym]
    end
  end
end
