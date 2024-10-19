class SgRomanizer

  BASE_SYMBOL={
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  def romanize(arabic)
    result=''
    splitted_arabic_arr=split_by_digits(arabic)
    splitted_arabic_arr.each do |arabic|
      msd = arabic.digits[-1]
      # 最上位桁の値で場合わけ
      result += case msd
      when 1,5
        BASE_SYMBOL[arabic]
      when 2,3
        BASE_SYMBOL[arabic/msd]*msd
      when 4,9
        BASE_SYMBOL[arabic/msd] + BASE_SYMBOL[arabic+arabic/msd] 
      when 6,7,8
        BASE_SYMBOL[arabic*5/msd] + BASE_SYMBOL[arabic/msd]*(msd-5)
      end 
    end
    result
  end

  def deromanize(roman)
    result = []
    arabic_arr = roman.chars.map {|r| BASE_SYMBOL.key(r)}
    arabic_arr.each.with_index do |arabic,idx|
      next_arabic = idx == arabic_arr.size - 1 ? 0 : arabic_arr[idx+1]
      if arabic < next_arabic
        result.push(-arabic)
      else
        result.push(arabic)
      end
    end
    result.sum
  end

  # 数字を桁ごとに分割する．例1） 1030 -> [1000,30]. 例2) 691 -> [600,90,1]
  def split_by_digits(arabic)
    digits_arr = arabic.digits
    digits_arr.map.with_index {|n,idx| n*(10**idx)}.reverse.reject{|n| n==0}
  end
end
