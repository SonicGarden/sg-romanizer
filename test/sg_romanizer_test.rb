require 'minitest/autorun'
require 'yaml'
require_relative '../lib/sg_romanizer'

class SgRomanizerTest < Minitest::Test
  def setup
    @romanizer = SgRomanizer.new
  end

  def test_romanize_1_to_10
    assert_equal 'I', @romanizer.romanize(1)
    assert_equal 'II', @romanizer.romanize(2)
    assert_equal 'III', @romanizer.romanize(3)
    assert_equal 'IV', @romanizer.romanize(4)
    assert_equal 'V', @romanizer.romanize(5)
    assert_equal 'VI', @romanizer.romanize(6)
    assert_equal 'VII', @romanizer.romanize(7)
    assert_equal 'VIII', @romanizer.romanize(8)
    assert_equal 'IX', @romanizer.romanize(9)
    assert_equal 'X', @romanizer.romanize(10)
  end

  def test_romanize_10_to_100
    assert_equal 'X', @romanizer.romanize(10)
    assert_equal 'XX', @romanizer.romanize(20)
    assert_equal 'XXX', @romanizer.romanize(30)
    assert_equal 'XL', @romanizer.romanize(40)
    assert_equal 'L', @romanizer.romanize(50)
    assert_equal 'LX', @romanizer.romanize(60)
    assert_equal 'LXX', @romanizer.romanize(70)
    assert_equal 'LXXX', @romanizer.romanize(80)
    assert_equal 'XC', @romanizer.romanize(90)
    assert_equal 'C', @romanizer.romanize(100)
  end

  def test_romanize_100_to_1000
    assert_equal 'C', @romanizer.romanize(100)
    assert_equal 'CC', @romanizer.romanize(200)
    assert_equal 'CCC', @romanizer.romanize(300)
    assert_equal 'CD', @romanizer.romanize(400)
    assert_equal 'D', @romanizer.romanize(500)
    assert_equal 'DC', @romanizer.romanize(600)
    assert_equal 'DCC', @romanizer.romanize(700)
    assert_equal 'DCCC', @romanizer.romanize(800)
    assert_equal 'CM', @romanizer.romanize(900)
    assert_equal 'M', @romanizer.romanize(1000)
  end

  def test_romanize_1000_to_3000
    assert_equal 'M', @romanizer.romanize(1000)
    assert_equal 'MM', @romanizer.romanize(2000)
    assert_equal 'MMM', @romanizer.romanize(3000)
  end

  def test_romanize_493
    assert_equal 'CDXCIII', @romanizer.romanize(493)
  end

  def test_romanize_2024
    assert_equal 'MMXXIV', @romanizer.romanize(2024)
  end

  def test_romanize_all
    load_pattern.each do |arabic, roman|
      assert_equal roman, @romanizer.romanize(arabic)
    end
  end

  def test_deromanize_1_to_10
    assert_equal 1, @romanizer.deromanize('I')
    assert_equal 2, @romanizer.deromanize('II')
    assert_equal 3, @romanizer.deromanize('III')
    assert_equal 4, @romanizer.deromanize('IV')
    assert_equal 5, @romanizer.deromanize('V')
    assert_equal 6, @romanizer.deromanize('VI')
    assert_equal 7, @romanizer.deromanize('VII')
    assert_equal 8, @romanizer.deromanize('VIII')
    assert_equal 9, @romanizer.deromanize('IX')
    assert_equal 10, @romanizer.deromanize('X')
  end

  def test_deromanize_10_to_100
    assert_equal 10, @romanizer.deromanize('X')
    assert_equal 20, @romanizer.deromanize('XX')
    assert_equal 30, @romanizer.deromanize('XXX')
    assert_equal 40, @romanizer.deromanize('XL')
    assert_equal 50, @romanizer.deromanize('L')
    assert_equal 60, @romanizer.deromanize('LX')
    assert_equal 70, @romanizer.deromanize('LXX')
    assert_equal 80, @romanizer.deromanize('LXXX')
    assert_equal 90, @romanizer.deromanize('XC')
    assert_equal 100, @romanizer.deromanize('C')
  end

  def test_deromanize_100_to_1000
    assert_equal 100, @romanizer.deromanize('C')
    assert_equal 200, @romanizer.deromanize('CC')
    assert_equal 300, @romanizer.deromanize('CCC')
    assert_equal 400, @romanizer.deromanize('CD')
    assert_equal 500, @romanizer.deromanize('D')
    assert_equal 600, @romanizer.deromanize('DC')
    assert_equal 700, @romanizer.deromanize('DCC')
    assert_equal 800, @romanizer.deromanize('DCCC')
    assert_equal 900, @romanizer.deromanize('CM')
    assert_equal 1000, @romanizer.deromanize('M')
  end

  def test_deromanize_1000_to_3000
    assert_equal 1000, @romanizer.deromanize('M')
    assert_equal 2000, @romanizer.deromanize('MM')
    assert_equal 3000, @romanizer.deromanize('MMM')
  end

  def test_deromanize_493
    assert_equal 493, @romanizer.deromanize('CDXCIII')
  end

  def test_deromanize_2024
    assert_equal 2024, @romanizer.deromanize('MMXXIV')
  end

  def test_deromanize_all
    load_pattern.each do |arabic, roman|
      assert_equal arabic, @romanizer.deromanize(roman)
    end
  end

  private

  def load_pattern
    file_path = File.expand_path('pattern.yml', File.dirname(__FILE__))
    YAML.load_file(file_path)
  end
end
