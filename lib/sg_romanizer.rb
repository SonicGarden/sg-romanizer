class SgRomanizer
  def romanize(arabic)
    raise ArgumentError unless (1..3999).cover?(arabic)

    [1000, 100, 10, 1].map do |digit|
      romasymbols = digit_to_romasymbols(digit)
      adjusted_arabic = arabic % (digit * 10)
      coefficient = (adjusted_arabic / digit).to_i
      romanize_format(coefficient, romasymbols)
    end.join
  end

  def deromanize(roman)
    raise ArgumentError unless roman.match?(/^[MDCLXVI]+$/)

    roman.split('').push('-').each_cons(2).map do |symbols|
      num = romasymbol_to_num(symbols[0])
      next_num = romasymbol_to_num(symbols[1])
      num < next_num ? -num : num
    end.sum
  end

  private

  def digit_to_romasymbols(digit)
    case digit
    when 1000 then ['M', nil, nil]
    when 100 then ['C', 'D', 'M']
    when 10 then ['X', 'L', 'C']
    when 1 then ['I', 'V', 'X']
    else []
    end
  end

  def romanize_format(num, symbols)
    i,v,x = symbols
    case num
    when 1 then i
    when 2 then i + i
    when 3 then i + i + i
    when 4 then i + v
    when 5 then v
    when 6 then v + i
    when 7 then v + i + i
    when 8 then v + i + i + i
    when 9 then i + x
    else ''
    end
  end

  def romasymbol_to_num(symbol)
    case symbol
    when 'M' then 1000
    when 'D' then 500
    when 'C' then 100
    when 'L' then 50
    when 'X' then 10
    when 'V' then 5
    when 'I' then 1
    else 0
    end
  end
end
