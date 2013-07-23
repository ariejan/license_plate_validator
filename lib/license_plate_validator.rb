class LicensePlateValidator

  def initialize(raw)
    @raw = normalize(raw || "")
  end

  attr_reader :raw

  def to_s
    raw
  end

  private

  def normalize(input)
    input.to_s.upcase.strip.gsub(/[^A-Z0-9]/, '')
  end

end
