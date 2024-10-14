class SgRomanizer
  def romanize(arabic)
    # write your code here
    if arabic == 1 then
      return "I"
    elsif arabic == 2 then
      return "II"
    elsif arabic == 3 then
      return "III"
    end

    str_arabic = arabic.to_s  
    len = str_arabic.length
    
    result = ""
    len.times do |i|
      target_digit = str_arabic[i].to_i
      if len - i == 4 then
        # 10^3
        result += "M" * str_arabic[i].to_i
      elsif len - i == 3 then
        # 10^2
        if target_digit < 5 then
          if target_digit < 4 then
            result += "C" * target_digit
          else
            result += "CD"
          end
        elsif target_digit == 5 then
          result += "D"
        elsif 5 < target_digit && target_digit < 9 then
          result += "D" + "C" * (target_digit - 5)
        elsif target_digit == 9 then
          result += "CM"
        end
      elsif len - i == 2 then
        # 10^1
      elsif len - i == 1 then
        # 10^0
      end
    end

    return result
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