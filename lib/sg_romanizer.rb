# frozen_string_literal: true

class SgRomanizer
  ROMAN_PATTERNS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }.freeze

  def initialize
    @digit_table = 4.times.map do |i|
      base = 10.pow(i)
      create_pattern(ROMAN_PATTERNS[base], ROMAN_PATTERNS[base * 5], ROMAN_PATTERNS[base * 10])
    end
  end

  def romanize(arabic)
    output = []
    arabic.to_s.split('').map(&:to_i).reverse.each_with_index do |num, i|
      output << @digit_table[i][num]
    end
    output.reverse.join
  end

  def deromanize(roman)
    values = roman.split('').map { |v| ROMAN_PATTERNS.invert[v] }
    values.map.with_index { |v, i| (values[i + 1]&.> v) ? -v : v }.sum
  end

  private

  def create_pattern(one, five, ten)
    pattern = [''] + 1.upto(3).map { |i| one * i } # '', I, II, III
    return pattern unless five

    pattern +
      ["#{one}#{five}"] +                          # IV
      4.times.map { |i| "#{five}#{one * i}" } +    # V, VI, VII, VIII
      ["#{one}#{ten}"]                             # IX
  end
end
