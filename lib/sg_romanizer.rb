class SgRomanizer
  def romanize(arabic)
    arabic.digits.map.with_index do |n,i|
      {
        1=> "I", 2=> "II", 3=> "III", 4=> "IV", 5=> "V", 6=> "VI", 7=> "VII", 8=> "VIII", 9=> "IX",
        10=> "X", 20=> "XX", 30=> "XXX", 40=> "XL", 50=> "L", 60=> "LX", 70=> "LXX", 80=> "LXXX", 90=> "XC",
        100=> "C", 200=> "CC", 300=> "CCC", 400=> "CD", 500=> "D", 600=> "DC", 700=> "DCC", 800=> "DCCC", 900=> "CM",
        1000=> "M",2000=> "MM", 3000=> "MMM"
      }[n * 10 ** i]
    end.reverse.join
  end

  def deromanize(roman)
    {
      "MMM"=> 3000, "MM"=> 2000, "M"=> 1000,
      "CM"=> 900, "DCCC"=> 800, "DCC"=> 700, "DC"=> 600, "D"=> 500, "CD"=> 400, "CCC"=> 300, "CC"=> 200, "C"=> 100,
      "XC"=> 90, "LXXX"=> 80, "LXX"=> 70, "LX"=> 60, "L"=> 50, "XL"=> 40, "XXX"=> 30, "XX"=> 20, "X"=> 10,
      "IX"=> 9, "VIII"=> 8, "VII"=> 7, "VI"=> 6, "V"=> 5, "IV"=> 4, "III"=> 3, "II"=> 2, "I"=> 1
    }.map do |k,v|
      if roman.index(k) == 0 then
        roman = roman[k.length..]
        v
      end
    end.compact.sum
  end
end
