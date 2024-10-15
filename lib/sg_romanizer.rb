class SgRomanizer
  def romanize(arabic)
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
    else
      return "Unexpected number."
    end
  end

  def deromanize(roman)
    target = roman
    result = 0

    while target.length != 0
      arabic, removed_length = generateArabic(target)
      result += arabic
      target = target.slice(removed_length, target.length)
    end
    return result
  end

  def generateArabic(roman)
    if roman.start_with?("MMM") then
      return 3000, 3
    elsif roman.start_with?("MM") then
      return 2000, 2
    elsif roman.start_with?("M") then
      return 1000, 1
    elsif roman.start_with?("CM") then
      return 900, 2
    elsif roman.start_with?("DCCC") then
      return 800, 4
    elsif roman.start_with?("DCC") then
      return 700, 3
    elsif roman.start_with?("DC") then
      return 600, 2
    elsif roman.start_with?("D") then
      return 500, 1
    elsif roman.start_with?("CD") then
      return 400, 2
    elsif roman.start_with?("CCC") then
      return 300, 3
    elsif roman.start_with?("CC") then
      return 200, 2
    elsif roman.start_with?("C") then
      return 100, 1
    elsif roman.start_with?("XC") then
      return 90, 2
    elsif roman.start_with?("LXXX") then
      return 80, 4
    elsif roman.start_with?("LXX") then
      return 70, 3
    elsif roman.start_with?("LX") then
      return 60, 2
    elsif roman.start_with?("L") then
      return 50, 1
    elsif roman.start_with?("XL") then
      return 40, 2
    elsif roman.start_with?("XXX") then
      return 30, 3
    elsif roman.start_with?("XX") then
      return 20, 2
    elsif roman.start_with?("X") then
      return 10, 1
    elsif roman.start_with?("IX") then
      return 9, 2
    elsif roman.start_with?("VIII") then
      return 8, 4
    elsif roman.start_with?("VII") then
      return 7, 3
    elsif roman.start_with?("VI") then
      return 6, 2
    elsif roman.start_with?("V") then
      return 5, 1
    elsif roman.start_with?("IV") then
      return 4, 2
    elsif roman.start_with?("III") then
      return 3, 3
    elsif roman.start_with?("II") then
      return 2, 2
    elsif roman.start_with?("I") then
      return 1, 1
    else
      return 0, 0
    end
  end
  
end