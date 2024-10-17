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
    roman.chars.reverse.map do |r|
      {"I"=> 1, "V"=> 5, "X"=> 10, "L"=> 50, "C"=> 100, "D"=> 500, "M"=> 1000}[r]
    end.inject([0]) do |result, n|
      result << (result.last > n ? -1 * n : n)
    end.sum
  end
end
