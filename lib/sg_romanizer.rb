class SgRomanizer
  ROMAN_WEIGHTS = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }.freeze
  ROMAN_CHAR = ROMAN_WEIGHTS.invert.freeze

  def initialize

  end

  def romanize(arabic)
    ret = ""
    nums = [1000, 100, 10]
    nums.each do |num|
      nine = (num * 0.9).to_i
      five = (num * 0.5).to_i
      four = (num * 0.4).to_i
      one = (num * 0.1).to_i

      ret += ROMAN_CHAR[num] * (arabic / num)
      arabic %= num

      ret += (ROMAN_CHAR[one] + ROMAN_CHAR[num]) * (arabic / nine)
      arabic %= nine

      ret += ROMAN_CHAR[five] * (arabic / five)
      arabic %= five

      ret += (ROMAN_CHAR[one] + ROMAN_CHAR[five]) * (arabic / four)
      arabic %= four

      ret += ROMAN_CHAR[one] * (arabic / one)
      arabic %= one
    end
    ret
  end

  def deromanize(roman)
    ret = 0
    should_skip_next = false
    roman.chars.each_cons(2) do |cur_char, next_char|
      if should_skip_next
        should_skip_next = false
        next
      end

      if cur_char == next_char
        ret += ROMAN_WEIGHTS[cur_char]
      elsif ROMAN_WEIGHTS[cur_char] < ROMAN_WEIGHTS[next_char]
        ret += ROMAN_WEIGHTS[next_char] - ROMAN_WEIGHTS[cur_char]
        should_skip_next = true
      else
        ret += ROMAN_WEIGHTS[cur_char]
      end
    end
    ret += ROMAN_WEIGHTS[roman[-1]] unless should_skip_next
    ret
  end
end
