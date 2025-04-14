class LicensePlateValidator

  PATTERNS = {
    # Poland
    pl: [
      # Standard car plates (2-letter powiat code)
      /^([A-Z]{2})\s([0-9]{5})$/,                # XY 12345
      /^([A-Z]{2})\s([0-9]{4}[A-HJ-NP-TV-Z])$/,  # XY 1234J
      /^([A-Z]{2})\s([0-9]{3}[A-HJ-NP-TV-Z]{2})$/,  # XY 123JK
      /^([A-Z]{2})\s([0-9][A-HJ-NP-TV-Z][0-9]{3})$/,  # XY 1J345
      /^([A-Z]{2})\s([0-9][A-HJ-NP-TV-Z]{2}[0-9]{2})$/,  # XY 1JK45
      
      # Standard car plates (3-letter powiat code)
      /^([A-Z]{3})\s([A-HJ-NP-TV-Z][0-9]{3})$/,  # XYZ J234
      /^([A-Z]{3})\s([0-9]{2}[A-HJ-NP-TV-Z]{2})$/,  # XYZ 12JK
      /^([A-Z]{3})\s([0-9][A-HJ-NP-TV-Z][0-9]{2})$/,  # XYZ 1J34
      /^([A-Z]{3})\s([0-9]{2}[A-HJ-NP-TV-Z][0-9])$/,  # XYZ 12J4
      /^([A-Z]{3})\s([0-9][A-HJ-NP-TV-Z]{2}[0-9])$/,  # XYZ 1JK4
      /^([A-Z]{3})\s([A-HJ-NP-TV-Z]{2}[0-9]{2})$/,  # XYZ JK34
      /^([A-Z]{3})\s([0-9]{5})$/,                # XYZ 12345
      /^([A-Z]{3})\s([0-9]{4}[A-HJ-NP-TV-Z])$/,  # XYZ 1234J
      /^([A-Z]{3})\s([0-9]{3}[A-HJ-NP-TV-Z]{2})$/,  # XYZ 123JK
      
      # Motorcycle plates (2-letter powiat code)
      /^([A-Z]{2})\s([0-9]{4})$/,                # XY 1234
      /^([A-Z]{2})\s([0-9]{3}[A-HJ-NP-TV-Z])$/,  # XY 123J
      /^([A-Z]{2})\s([0-9][A-HJ-NP-TV-Z][0-9]{2})$/,  # XY 1J34
      /^([A-Z]{2})\s([0-9]{2}[A-HJ-NP-TV-Z][0-9])$/,  # XY 12J4
      /^([A-Z]{2})\s([0-9]{2}[A-HJ-NP-TV-Z]{2})$/,  # XY 12JK
      /^([A-Z]{2})\s([A-HJ-NP-TV-Z]{2}[0-9]{2})$/,  # XY JK12
      
      # Reduced size plates
      /^([A-Z])\s([0-9]{3})$/,                   # X 123
      /^([A-Z])\s([0-9]{2}[A-HJ-NP-TV-Z])$/,     # X 12J
      /^([A-Z])\s([0-9][A-HJ-NP-TV-Z][0-9])$/,   # X 1J2
      /^([A-Z])\s([A-HJ-NP-TV-Z][0-9]{2})$/,     # X J12
      /^([A-Z])\s([0-9][A-HJ-NP-TV-Z]{2})$/,     # X 1JK
      /^([A-Z])\s([A-HJ-NP-TV-Z]{2}[0-9])$/,     # X JK1
      /^([A-Z])\s([A-HJ-NP-TV-Z][0-9][A-HJ-NP-TV-Z])$/,  # X J1K
      
      # Classic car plates
      /^([A-Z]{2})\s([0-9]{2}[A-HJ-NP-TV-Z])$/,  # XY 12J
      /^([A-Z]{2})\s([0-9]{3})$/,                # XY 123
      /^([A-Z]{3})\s([0-9][A-HJ-NP-TV-Z])$/,     # XYZ 1J
      /^([A-Z]{3})\s([0-9]{2})$/,                # XYZ 12
      /^([A-Z]{3})\s([A-HJ-NP-TV-Z][0-9])$/,     # XYZ J1
      
      # Temporary and export plates
      /^([A-Z][0-9])\s([0-9]{4})$/,              # X1 2345
      /^([A-Z][0-9])\s([0-9]{3}[A-HJ-NP-TV-Z])$/,  # X1 234J
      
      # Testing vehicle plates
      /^([A-Z][0-9])\s([0-9]{3})\sB$/,           # X1 234 B
      
      # Custom plates
      # Letters must come before digits (they cannot be intermixed)
      /^([A-Z][0-9])\s([A-Z][A-Z]{2,4})$/,       # X1 ABCDE (all letters)
      /^([A-Z][0-9])\s([A-Z][A-Z]{1,3}[0-9]{1,2})$/,  # X1 ABC12 (letters followed by up to 2 digits)
      
      # Professional plates
      /^([A-Z][0-9]{2})\s([0-9]{2}P[0-9]{2})$/   # X12 34P56
    ],
    
    # Netherlands
    nl: [
      /^([a-zA-Z]{2})-?([0-9]{2})-?([0-9]{2})$/,
      /^([0-9]{2})-?([0-9]{2})-?([a-zA-Z]{2})$/,
      /^([0-9]{2})-?([a-zA-Z]{2})-?([0-9]{2})$/,
      /^([a-zA-Z]{2})-?([0-9]{2})-?([a-zA-Z]{2})$/,
      /^([a-zA-Z]{2})-?([a-zA-Z]{2})-?([0-9]{2})$/,
      /^([0-9]{2})-?([a-zA-Z]{2})-?([a-zA-Z]{2})$/,
      /^([0-9]{2})-?([a-zA-Z]{3})-?([0-9]{1})$/,
      /^([0-9]{1})-?([a-zA-Z]{3})-?([0-9]{2})$/,
      /^([a-zA-Z]{2})-?([0-9]{3})-?([a-zA-Z]{1})$/,
      /^([a-zA-Z]{1})-?([0-9]{3})-?([a-zA-Z]{2})$/,
      /^([a-zA-Z]{3})-?([0-9]{2})-?([a-zA-Z])$/,
      /^([0-9]{3})-?([a-zA-Z]{2})-?([0-9])$/,
      /^([a-zA-Z])-?([0-9]{2})-?([a-zA-Z]{3})$/,
      /^([0-9])-?([a-zA-Z]{2})-?([0-9]{3})$/
    ],
    # Germany
    de: [
      # first part: distinguisher for area
      # second part (a) 1-2 characters followed by 1-4 numbers
      #          or (b) for diplomatic purposes:
      #                 1. a 4-digit number starting with 9
      #                 2. a 2-3-digit-number (country identifier) followed by 1-3 digits
      # diplomatic license plates can be followed by a single letter
      # regular license plates can be followed by an 'H' for oldtimers
      /^(A|AA|AB|ABG|ABI|AC|AE|AD|AF|AIC|AK|ALF|AM|AN|ANA|ANK|AÖ|AP|APD|ARN|ART|AS|ASL|ASZ|AT|AU|AUR|AW|AZ|AZE|B|BA|BAD|BAR|BB|BBG|BC|BCH|BD|BED|BER|BF|BGL|BI|BID|BIN|BIR|BIT|BIW|BK|BKS|BL|BLB|BLK|BM|BN|BNA|BO|BÖ|BOR|BOT|BRA|BRB|BRG|BRL|BRV|BS|BT|BTF|BÜD|BÜS|BÜZ|BW|BWL|BYL|BZ|C|CA|CAS|CB|CE|CHA|CLP|CLZ|CO|COC|COE|CUX|CW|D|DA|DAH|DAN|DAU|DB|DBR|DD|DE|DEG|DEL|DGF|DH|DI|DIN|DL|DLG|DM|DN|DO|DON|DU|DÜW|DW|DZ|E|EA|EB|EBE|ECK|ED|EE|EF|EH|EI|EIC|EIL|EIN|EIS|EL|EM|EMD|EMS|EN|ER|ERB|ERH|ERZ|ES|ESW|EU|EW|F|FB|FD|FDS|FF|FFB|FG|FI|FL|FLO|FN|FO|FOR|FR|FRG|FRI|FRW|FS|FT|FTL|FÜ|G|GA|GAP|GC|GD|GDB|GE|GER|GEO|GF|GG|GHA|GHC|GI|GL|GLA|GM|GMN|GN|GNT|GÖ|GOA|GP|GR|GRH|GRZ|GS|GT|GTH|GUB|GÜ|GVM|GW|GZ|H|HA|HAL|HAM|HAS|HB|HBN|HBS|HC|HCH|HD|HDH|HDL|HE|HEF|HEI|HER|HET|HF|HG|HGN|HGW|HH|HHM|HI|HIG|HK|HK|HL|HM|HMÜ|HN|HO|HOG|HOL|HOM|HOT|HP|HR|HRO|HS|HSK|HST|HU|HVL|HWI|HX|HY|HZ|IGB|IK|IL|IN|IZ|J|JE|JL|JÜL|K|KA|KB|KC|KE|KEH|KF|KG|KH|KI|KIB|KL|KLE|KLZ|KM|KN|KO|KÖT|KR|KS|KT|KU|KÜN|KUS|KY|KYF|L|LA|LAU|LB|LBS|LBZ|LD|LDK|LDS|LEO|LER|LEV|LG|LI|LIF|LIP|LL|LM|LÖ|LÖB|LOS|LP|LRO|LSA|LSZ|LU|LUN|LWL|M|MA|MAB|MB|MC|MD|ME|MEI|MEK|MG|MGN|MH|MHL|MI|MIL|MKK|ML|MK|MM|MN|MO|MOL|MOS|MQ|MR|MS|MSH|MSP|MST|MTK|MTL|MÜ|MÜR|MW|MW|MYK|MZ|MZG|N|NB|ND|NDH|NE|NEA|NEB|NES|NEW|NF|NH|NI|NK|NM|NMB|NMS|NOH|NOL|NOM|NOR|NP|NR|NU|NVP|NW|NWM|NY|NZ|OA|OAL|OB|OBG|OC|OCH|OD|OE|OF|OG|OH|OHA|OHV|OHZ|OK|OL|OPR|OS|OSL|OVL|OVP|P|PA|PAF|PAN|PB|PCH|PE|PF|PI|PIR|PL|PLÖ|PM|PN|PR|PRÜ|PS|PW|QFT|QLB|R|RA|RC|RD|RDG|RE|REG|RG|RH|RI|RIE|RL|RM|RO|ROW|RP|RS|RSL|RT|RÜD|RÜG|RV|RW|RZ|S|SAB|SAD|SAW|SB|SBK|SC|SCZ|SDH|SDL|SE|SEB|SEE|SFA|SFB|SFT|SG|SGH|SHA|SHG|SHK|SHL|SI|SIG|SIM|SK|SL|SLF|SLK|SLN|SLS|SLÜ|SLZ|SM|SN|SO|SÖM|SOK|SON|SP|SPN|SR|SRB|SRO|ST|STA|STD|STL|SU|SÜW|SW|SZ|SZB|TBB|TDO|TE|TET|TF|TG|TIR|TO|TÖL|TR|TS|TÜ|TUT|UE|UEM|UER|UH|UL|UM|UN|USI|V|VB|VEC|VER|VG|VIE|VK|VR|VS|W|WAF|WAK|WAN|WAT|WB|WBS|WDA|WE|WEN|WES|WF|WHV|WI|WIL|WIS|WIT|WK|WL|WLG|WM|WMS|WN|WND|WO|WOB|WOH|WR|WSF|WST|WT|WTM|WÜ|WUG|WUN|WUR|WW|WZL|X|Y|Z|ZE|ZEL|ZI|ZP|ZR|ZW|ZZ)[\- ]((?:[a-z]{1,2}[\- ]*\d{1,4}[HE]?)|(9\d{3})|(\d{2,3}\-\d{1,3})[a-z]?)$/i,
      # more diplomatic license plates ;)
      /^0[\- ]\d{1,3}[\- ]\d{1,3}\w?$/i
    ]
  }.freeze

  def initialize(raw, options = {})
    @options = {
      country: nil
    }.merge(options)

    @raw = raw || ''
  end

  attr_reader :raw

  def valid?
    return true if @options[:country].nil?

    country = @options[:country].to_sym

    return true unless supported_countries.include?(country)

    PATTERNS[country].any? { |pattern| raw =~ pattern }
  end

  def supported_countries
    PATTERNS.keys
  end

  def patterns_for_country(country)
    return PATTERNS[country] || []
  end

  def to_s
    raw
  end
end

require 'license_plate_validator/version'
require 'license_plate_validator/active_model' if defined?(ActiveModel)
