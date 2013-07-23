require 'spec_helper'

describe LicensePlateValidator do
  it 'should have a version number' do
    LicensePlateValidator::VERSION.should_not be_nil
  end

  describe "#new" do
    it 'demands one and only one argument' do
      expect { LicensePlateValidator.new }.to raise_error
      expect { LicensePlateValidator.new("a", "b") }.to raise_error
      expect { LicensePlateValidator.new ("a") }.not_to raise_error
    end

    it 'normalizes the input string' do
      expect(LicensePlateValidator.new('60-NFH-1').to_s).to eql('60NFH1')
      expect(LicensePlateValidator.new('fz-xx-61').to_s).to eql('FZXX61')
    end
  end

  context "NL - Netherlands" do
    NL_VALID_SAMPLES = [
      "FZ-61-24",
      "24-61-FX",
      "24-FZ-61",
      "FZ-61-XX",
      "FZ-XX-61",
      "82-HS-JH",
      "61-NFH-1",
      "1-KGB-42",
      "FZ-142-X",
      "X-721-FZ"
    ]

    NL_INVALID_SAMPLES = [
      "DEF-123",
      "123-DEF",
      "DEFGHI",
      "123456"
    ]

    NL_VALID_SAMPLES.each do |number|
      it "accepts '#{number}'" do
        license = LicensePlateValidator.new(number)
        expect(license).to be_valid
      end
    end

    NL_INVALID_SAMPLES.each do |number|
      it "does not accept '#{number}'" do
        license = LicensePlateValidator.new(number)
        expect(license).not_to be_valid
      end
    end
  end
end
