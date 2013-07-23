require 'spec_helper'

if defined?(ActiveModel)
  class Vehicle < ModelBase
    validates :number, license_plate: true
  end

  describe Vehicle do
    context "with a valid license plate number" do
      it "is valid" do
        obj = Vehicle.new(number: "60-NFH-1")
        expect(obj).to be_valid
      end
    end
  end
end
