require 'spec_helper'

if defined?(ActiveModel)

  class DutchVehicle < ModelBase
    validates :number, license_plate: { country: :nl }
  end

  class UnknownVehicle < ModelBase
    validates :number, license_plate: true
  end

  describe DutchVehicle do
    it "accepts Dutch plates only" do
      obj = DutchVehicle.new(number: "60-NFH-1")
      expect(obj).to be_valid

      obj = DutchVehicle.new(number: "SBA5226")
      expect(obj).not_to be_valid
    end
  end

  describe UnknownVehicle do
    it "accepts both Dutch and German plates" do
      obj = UnknownVehicle.new(number: "60-NFH-1")
      expect(obj).to be_valid

      obj = UnknownVehicle.new(number: "SBA5226")
      expect(obj).to be_valid
    end
  end
end
