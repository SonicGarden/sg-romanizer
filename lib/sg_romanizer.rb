class SgRomanizer
  ROMAN_WEIGHTS = {
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000
  }.freeze
  ROMAN_CHAR = ROMAN_WEIGHTS.invert.freeze

  def romanize(arabic)
    ret = ""

    [1000, 100, 10].each do |num|
      portions = [
        num,
        (num * 0.9).to_i,
        (num * 0.5).to_i,
        (num * 0.4).to_i,
        (num * 0.1).to_i
      ]

      portions.each do |portion|
        ret += ROMAN_CHAR[portion] * (arabic / portion)
        arabic %= portion
      end
    end

    ret
  end

  def deromanize(roman)
    ret = 0

    while !roman.empty?
      if ROMAN_WEIGHTS[roman[0..1]]
        ret += ROMAN_WEIGHTS[roman[0..1]]
        roman.slice!(0, 2)
      else
        ret += ROMAN_WEIGHTS[roman[0]]
        roman.slice!(0, 1)
      end
    end

    ret
  end
end
