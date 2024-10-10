class SgRomanizer
  def romanize(arabic)
    level4_num, level3_num, level2_num, level1_num = arabic.to_s.rjust(4).split('').map(&:to_i)
    level1 =
      case level1_num
      when (1..3) then 'I' * level1_num
      when 4 then 'IV'
      when 5 then 'V'
      when (6..8) then 'V' + 'I' * (level1_num - 5)
      when 9 then 'IX'
      else
        ''
      end
    level2 =
      case level2_num
      when (1..3) then 'X' * level2_num
      when 4 then 'XL'
      when 5 then 'L'
      when (6..8) then 'L' + 'X' * (level2_num - 5)
      when 9 then 'XC'
      when 10 then 'C'
      else
        ''
      end
    level3 =
      case level3_num
      when (1..3) then 'C' * level3_num
      when 4 then 'CD'
      when 5 then 'D'
      when (6..8) then 'D' + 'C' * (level3_num - 5)
      when 9 then 'CM'
      when 10 then 'M'
      else
        ''
      end
    level4 =
      case level4_num
      when (1..3) then 'M' * level4_num
      else
        ''
      end
    "#{level4}#{level3}#{level2}#{level1}"
  end

  def deromanize(roman)
    table = [
      %w(I II III IV V VI VII VIII IX),
      %w(X XX XXX XL L LX LXX LXXX XC),
      %w(C CC CCC CD D DC DCC DCCC CM),
      %w(M MM MMM),
    ]

    remain_roman = roman
    table.reverse.map do |row|
      x = row.reverse.filter { remain_roman.match(/^#{_1}/) }.first
      if x
        remain_roman = remain_roman.sub(x, '')
        row.find_index(x) + 1
      else
        '0'
      end
    end.join.to_i
  end
end
