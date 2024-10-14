class SgRomanizer
  ROMAN_TO_ARABIC = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000,
  }

  SUBTRACTIVE_NOTATION_NUMBERS_TO_ARABIC = {
    'IV' => 4,
    'IX' => 9,
    'XL' => 40,
    'XC' => 90,
    'CD' => 400,
    'CM' => 900,
  }

  def romanize(arabic)
    # write your code here
  end

  def deromanize(roman)
    roman = roman.dup
    result_arabic_number = 0

    SUBTRACTIVE_NOTATION_NUMBERS_TO_ARABIC.each do |key, val|
      if roman.include?(key)
        result_arabic_number += val
        roman.gsub!(key, "")
      end
    end

    ROMAN_TO_ARABIC.each do |key, val|
      key_count = roman.count(key)
      result_arabic_number += key_count * val
    end

    result_arabic_number
  end
end
