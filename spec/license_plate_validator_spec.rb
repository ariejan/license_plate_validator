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
    SAMPLES = [
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

    # SAMPLES.each do |number|
    #   it "accepts #{number}" do
    #     expect(LicensePlateValidator.new(number)).to be_true
    #   end
    # end

  end
end
