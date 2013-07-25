require 'active_model'

module ActiveModel
  module Validations
    class LicensePlateValidator < ::ActiveModel::EachValidator

      def validate_each(record, attribute, value)
        country = case(options[:country])
                  when Proc then options[:country].call(record)
                  when nil then nil
                  else options[:country].to_sym
                  end

        license_plate = ::LicensePlateValidator.new(value.to_s, { country: country })

        if !license_plate.valid?
          record.errors.add(attribute, :invalid_license_plate, message: options[:message])
        end
      end

    end
  end
end

I18n.load_path += Dir["#{File.dirname(__FILE__)}/locales/*.yml"]
