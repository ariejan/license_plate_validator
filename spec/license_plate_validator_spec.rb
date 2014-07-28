require 'spec_helper'

describe LicensePlateValidator do
  it 'should have a version number' do
    LicensePlateValidator::VERSION.should_not be_nil
  end

  describe "#new" do
    it 'demands one argument, optionally a second' do
      expect { LicensePlateValidator.new() }.to raise_error
      expect { LicensePlateValidator.new ("a") }.not_to raise_error
      expect { LicensePlateValidator.new("a", country: :nl) }.not_to raise_error
      expect { LicensePlateValidator.new("a", country: nil) }.not_to raise_error
    end
  end

  context "#supported countries" do
    subject { LicensePlateValidator.new("a") }

    it "returns array of symbols" do
      expect(subject.supported_countries).to eql([:nl, :de])
    end
  end

  context "#patterns_for_country" do
    subject { LicensePlateValidator.new("a") }

    it "returns empty array for unknown countries" do
      expect(subject.patterns_for_country(:se)).to eql([])
    end

    it "returns array of patterns for known countries" do
      expect(subject.patterns_for_country(:nl).size).to eql(10)
    end
  end

  context "country specific validations" do
    context "with a specific country selected" do
      it "accepts license plates for that country" do
        license = LicensePlateValidator.new("60-NFH-1", country: :nl)
        expect(license).to be_valid
      end

      it "does not accept foreign license plates" do
        license = LicensePlateValidator.new("SBA5226", country: :nl)
        expect(license).not_to be_valid
      end
    end

    context "with an unknown country selected" do
      it "accepts all license plates" do
        license = LicensePlateValidator.new("60-NFH-1", country: :se)
        expect(license).to be_valid

        license = LicensePlateValidator.new("SBA5226", country: :se)
        expect(license).to be_valid
      end
    end

    context "without a country selected" do
      it "accepts all license plates / does no validation" do
        license = LicensePlateValidator.new("60-NFH-1", country: nil)
        expect(license).to be_valid

        license = LicensePlateValidator.new("SBA5226", country: nil)
        expect(license).to be_valid
      end
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
      "123456",
    ]

    NL_VALID_SAMPLES.each do |number|
      it "accepts '#{number}'" do
        license = LicensePlateValidator.new(number, country: :nl)
        expect(license).to be_valid
      end
    end

    NL_INVALID_SAMPLES.each do |number|
      it "does not accept '#{number}'" do
        license = LicensePlateValidator.new(number, country: :nl)
        expect(license).not_to be_valid
      end
    end
  end

  context "DE - Germany" do
    DE_VALID_SAMPLES = [
      "K-AB-123",
      "GL-A-123H",
      "K-9123",
      "0-12-123",
      "0-12-234H"
    ]

    DE_INVALID_SAMPLES = [
        "FOO-AB-123",
        "123",
        "K-2"
    ]

    DE_VALID_SAMPLES.each do |sample|
      it "accepts '#{sample}'" do
        license = LicensePlateValidator.new(sample, country: :de)
        expect(license).to be_valid
      end
    end

    DE_INVALID_SAMPLES.each do |sample|
      it "rejects '#{sample}'" do
        license = LicensePlateValidator.new(sample, country: :de)
        expect(license).to_not be_valid
      end
    end
  end
end
