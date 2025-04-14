require 'spec_helper'

RSpec.describe LicensePlateValidator do
  it 'should have a version number' do
    expect(LicensePlateValidator::VERSION).not_to be_nil
  end

  context "#new" do
    it 'demands one argument, optionally a second' do
      expect { LicensePlateValidator.new() }.to raise_error(ArgumentError)
      expect { LicensePlateValidator.new ("a") }.not_to raise_error
      expect { LicensePlateValidator.new("a", country: :nl) }.not_to raise_error
      expect { LicensePlateValidator.new("a", country: nil) }.not_to raise_error
    end
  end

  context "#supported countries" do
    subject { LicensePlateValidator.new("a") }

    it "returns array of symbols" do
      expect(subject.supported_countries).to eql([:pl, :nl, :de])
    end
  end

  context "#patterns_for_country" do
    subject { LicensePlateValidator.new("a") }

    it "returns empty array for unknown countries" do
      expect(subject.patterns_for_country(:se)).to eql([])
    end

    it "returns array of patterns for known countries" do
      expect(subject.patterns_for_country(:nl).size).to eql(14)
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
      "X-721-FZ",
      "GBB-01-B",
      "V-01-BBB",
      "9-XX-999",
      "999-XX-9"
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
      "B-AD-4563E",
      "AC A123",
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

  context "PL - Poland" do
    PL_VALID_SAMPLES = [
      # Standard car plates
      "WA 12345",  # Warsaw
      "WA 1234J",  # Warsaw
      "WA 123JK",  # Warsaw
      "WA 1J345",  # Warsaw
      "WA 1JK45",  # Warsaw
      "GDA J234",  # Gdansk (3-letter code)
      "GDA 12JK",  # Gdansk
      "GDA 1J34",  # Gdansk
      "GDA 12J4",  # Gdansk
      "GDA 1JK4",  # Gdansk
      "GDA JK34",  # Gdansk
      "GDA 12345", # Gdansk
      "GDA 1234J", # Gdansk
      "GDA 123JK", # Gdansk
      
      # Motorcycle plates
      "WA 1234",   # Warsaw
      "WA 123J",   # Warsaw
      "WA 1J34",   # Warsaw
      "WA 12J4",   # Warsaw
      "WA 12JK",   # Warsaw
      "WA JK12",   # Warsaw
      
      # Reduced size plates
      "W 123",     # Masovian
      "W 12J",     # Masovian
      "W 1J2",     # Masovian
      "W J12",     # Masovian
      "W 1JK",     # Masovian
      "W JK1",     # Masovian
      "W J1K",     # Masovian
      
      # Classic car plates
      "WA 12J",    # Warsaw
      "WA 123",    # Warsaw
      "GDA 1J",    # Gdansk
      "GDA 12",    # Gdansk
      "GDA J1",    # Gdansk
      
      # Temporary and export plates
      "W1 2345",   # Masovian
      "W1 234J",   # Masovian
      
      # Testing vehicle plates
      "W1 234 B",  # Masovian
      
      # Custom plates
      "W1 ABCDE",  # Masovian
      "W1 ABC12",  # Masovian
      
      # Professional plates
      "W12 34P56"  # Masovian
    ]

    PL_INVALID_SAMPLES = [
      # Invalid formats
      "W 1234567",  # Too many digits
      "W ABCDEF",   # No digit after voivodeship code
      "WXYZ 123",   # Too many letters in area code
      "W-123-ABC",  # Incorrect separator
      "123 ABC",    # No voivodeship code
      "W1234",      # No space
      "W1 ABCDE1",  # Digit not at the end in custom plate
      "W1 1ABCD",   # Digit at the beginning in custom plate
      "W1 AB1CD",   # Intermixed digits and letters in custom plate
      "W12 34X56"   # Professional plate with wrong letter (not P)
    ]

    PL_VALID_SAMPLES.each do |number|
      it "accepts '#{number}'" do
        license = LicensePlateValidator.new(number, country: :pl)
        expect(license).to be_valid
      end
    end

    PL_INVALID_SAMPLES.each do |number|
      it "does not accept '#{number}'" do
        license = LicensePlateValidator.new(number, country: :pl)
        expect(license).not_to be_valid
      end
    end
  end
end
