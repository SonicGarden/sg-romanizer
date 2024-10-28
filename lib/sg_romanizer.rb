class SgRomanizer
  TABLE = [
    %w[I II III IV V VI VII VIII IX],
    %w[X XX XXX XL L LX LXX LXXX XC],
    %w[C CC CCC CD D DC DCC DCCC CM],
    %w[M MM MMM],
  ].freeze

  def romanize(arabic)
    arabic.digits.filter_map.with_index do |digit, y_pos|
      TABLE[y_pos][digit - 1] if digit.nonzero?
    end.reverse.join
  end

  def deromanize(roman)
    copied_roman = roman.dup
    positions = []
    TABLE.reverse.each_with_index do |nums, y_pos|
      nums.reverse.each_with_index do |num, x_pos|
        positions << [y_pos, x_pos] if copied_roman.delete_prefix!(num)
      end
    end
    positions.sum do |y_pos, x_pos|
      max_x_pos = y_pos.zero? ? 3 : 9
      (max_x_pos - x_pos) * 10**(TABLE.size - y_pos - 1)
    end
  end
end
