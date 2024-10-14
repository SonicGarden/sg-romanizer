class SgRomanizer
  def romanize(arabic)
    # write your code here
    str_arabic = arabic.to_s  
    len = str_arabic.length
    result = ""
    
    len.times do |i|
      target_digit = str_arabic[i].to_i
      if len - i == 4 then
        # 10^3
        result += "M" * target_digit
      elsif len - i == 3 then
        # 10^2
        result += generateRoman(target_digit, "D", "C", "M")
      elsif len - i == 2 then
        # 10^1
        result += generateRoman(target_digit, "L", "X", "C")
      elsif len - i == 1 then
        # 10^0
        result += generateRoman(target_digit, "V", "I", "X")
      end
    end

    return result
  end
    
  def generateRoman(target_digit, fifth_key, unit, nextUnit)
    if target_digit < 4 then
      return unit * target_digit
    elsif target_digit == 4 then
      return unit + fifth_key
    elsif target_digit == 5 then
      return fifth_key
    elsif 5 < target_digit && target_digit < 9 then
      return fifth_key + unit * (target_digit - 5)
    elsif target_digit == 9 then
      return unit + nextUnit
    end
    
  end

  def deromanize(roman)
    4000.times do |i|
      if roman == romanize(i) then
        return i
      end
    end
    
    return 0
  end
  
end