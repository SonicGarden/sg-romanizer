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
    result_romanized_text = ""
    arabic_to_roman = ROMAN_TO_ARABIC.invert
    arabic_to_subtractive_notation_numbers = SUBTRACTIVE_NOTATION_NUMBERS_TO_ARABIC.invert

    arabic.digits.each_with_index do |num, index|
      digit = 10 ** index
      higher_digit = digit * 5

      if num == 4 || num ==9
        insert_roman_text = arabic_to_subtractive_notation_numbers[num * digit]
        next result_romanized_text.prepend(insert_roman_text)
      end

      if num >= 5
        higher_digit_text = arabic_to_roman[higher_digit]
        digit_text = arabic_to_roman[digit] * (num - 5)
        insert_roman_text = higher_digit_text + digit_text
        next result_romanized_text.prepend(insert_roman_text)
      end

      insert_roman_text = arabic_to_roman[digit] * num
      result_romanized_text.prepend(insert_roman_text)
    end

    result_romanized_text
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
