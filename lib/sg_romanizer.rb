class SgRomanizer
  ROMAN_SYMBOLS = ["I", "V", "X", "L", "C", "D", "M"]
  MAX_ARABIC = 3999

  def romanize(arabic)
    ret = ''
    digits = to_digits(arabic)
    digits.each_with_index{|digit, i|
      place = digits.length - i
      ret << to_roman(place, digit)
    }
    return ret
  end

  def deromanize(roman)
    for arabic in 1..MAX_ARABIC do
      if roman == romanize(arabic)
        return arabic
      end
    end
  end

  private def to_digits(arabic)
    ret = []
    for digit in arabic.to_s.chars do
      ret << digit.to_i
    end
    return ret
  end

  private def to_roman(place, digit)
    unit_index = 2 * place - 2
    unit = ROMAN_SYMBOLS[unit_index]
    if digit <= 3
      return unit * digit
    end
    base5 = ROMAN_SYMBOLS[unit_index + 1]
    if digit == 4
      return unit + base5
    end
    if digit <= 8
      return base5 + unit * (digit - 5)
    end
    base10 = ROMAN_SYMBOLS[unit_index + 2]
    if digit == 9
      return unit + base10
    end
  end
end
