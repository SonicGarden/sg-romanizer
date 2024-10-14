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
    # write your code here
    if roman == "I" then
      return 1
    elsif roman == "II" then
      return 2
    elsif roman == "III" then
      return 3 
    end
  end

  # 1: 'I'
  # 2: 'II'
  # 3: 'III'
  # 4: 'IV'
  # 5: 'V'
  # 6: 'VI'
  # 7: 'VII'
  # 8: 'VIII'
  # 9: 'IX'
  # 10: 'X'
  # 10 = X
  # 20 = XX
  # 30 = XXX
  # 40 = XL
  # 50 = L
  # 60 = LX
  # 70 = LXX
  # 80 = LXXX
  # 90 = XC
  # 100 = C
  # 200 = CC
  # 300 = CCC
  # 400 = CD
  # 500 = D
  # 600 = DC
  # 700 = DCC
  # 800 = DCCC
  # 900 = CM
  # 1000 = M
  # 2000 = MM
  # 3000 = MMM
  
end

sgr = SgRomanizer.new