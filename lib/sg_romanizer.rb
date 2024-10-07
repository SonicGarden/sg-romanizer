class SgRomanizer
  ARABIC_TO_ROMAN = [
    { # 0
      1 => 'I',
      2 => 'II',
      3 => 'III',
      4 => 'IV',
      5 => 'V',
      6 => 'VI',
      7 => 'VII',
      8 => 'VIII',
      9 => 'IX',
    },
    { # 10
      1 => 'X',
      2 => 'XX',
      3 => 'XXX',
      4 => 'XL',
      5 => 'L',
      6 => 'LX',
      7 => 'LXX',
      8 => 'LXXX',
      9 => 'XC',
    },
    { # 100
      1 => 'C',
      2 => 'CC',
      3 => 'CCC',
      4 => 'CD',
      5 => 'D',
      6 => 'DC',
      7 => 'DCC',
      8 => 'DCCC',
      9 => 'CM',
    },
    { # 1000
      1 => 'M',
      2 => 'MM',
      3 => 'MMM',
    }
  ]

  def romanize(arabic)
    arabic.to_s
      .chars
      .reverse
      .zip(ARABIC_TO_ROMAN)
      .map { |c, a2r| a2r[c.to_i] || '' }
      .reverse
      .join
  end

  def deromanize(roman)
    tokens = ARABIC_TO_ROMAN.reverse
               .map { |a2r| a2r.values.sort_by { |k, _| k.size * -1 } }
               .map do |prefixes|
                 prefixes.find { roman.start_with?(_1) }.tap do |prefix|
                   roman = roman.chars.drop(prefix.size).join if prefix
                 end
               end
    roman_to_arabic = ARABIC_TO_ROMAN.reverse.map { _1.invert }
    tokens.zip(roman_to_arabic)
      .map { |t, r2a| r2a[t] || 0 }
      .join.to_i
  end
end
