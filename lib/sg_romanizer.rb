class SgRomanizer
  def romanize(_arabic)
    # 範囲外の数字はnilを返す
    return nil if _arabic <= 0 || _arabic > 3999

    # 1の位から順番に該当するローマ数字を配列に代入し
    # reverse、joinでローマ数字を表示。
    _arabic.to_s.length.times
           .map { |keta| [exchange(_arabic, keta)] }
           .reverse
           .join('')
  end

  def deromanize(roman)
    # 変数初期化(範囲外の数字はnilを返す)
    arabic = nil

    # 該当するローマ数字を総当たりする
    (1..3999).each do |num|
      next if romanize(num) != roman

      arabic = num
      break
    end

    arabic
  end

  private

  # 1の位から千の位まで必要なローマ数字を配列にセット
  # (0に対応するローマ数字がないため最初に0を代入。)
  def ary
    [%w[0 I II III IV V VI VII VIII IX], # 1の位
     %w[0 X XX XXX XL L LX LXX LXXX XC], # 10の位
     %w[0 C CC CCC CD D DC DCC DCCC CM], # 100の位
     %w[0 M MM MMM]]                     # 1000の位
  end

  # 該当するローマ数字を返す
  # (_arabic = 数字,kurai = 位)
  def exchange(_arabic, kurai)
    # 対象となる位の数字をtargetに代入
    # String.slice(n)にマイナスの数字を入れると末尾から数えた
    # 数字を取り出すことができる。
    # (kuraiが0から始まっているため1を足す)
    target = _arabic.to_s.slice(-(kurai + 1)).to_i
    if target == 0
      # targetが0なら空文字を返す
      ''
    else
      ary[kurai][target]
    end
  end
end
