# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'license_plate_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "LicensePlateValidator"
  spec.version       = LicensePlateValidator::VERSION
  spec.authors       = ["Ariejan de Vroom"]
  spec.email         = ["ariejan@ariejan.net"]
  spec.description   = %q{Formatting and content of license plate codes can be validated in some countries. This gem add Rails validators for this to your project.}
  spec.summary       = %q{Validate license plate numbers for countries that support it.}
  spec.homepage      = "https://ariejan.github.io/license_plate_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'activemodel', '>=3.0'
end
