require 'minitest/autorun'
require 'yaml'
require_relative '../lib/sg_romanizer'

class SgRomanizerTest < Minitest::Test
  def setup
    @romanizer = SgRomanizer.new
  end

  def test_romanize
    assert_equal 'I', @romanizer.romanize(1)
    assert_equal 'II', @romanizer.romanize(2)
    assert_equal 'III', @romanizer.romanize(3)
    
    assert_equal 'M', @romanizer.romanize(1000)
    assert_equal 'MC', @romanizer.romanize(1100)
    assert_equal 'MCC', @romanizer.romanize(1200)
    assert_equal 'MCCC', @romanizer.romanize(1300)
    assert_equal 'MCD', @romanizer.romanize(1400)
    assert_equal 'MD', @romanizer.romanize(1500)
    assert_equal 'MDC', @romanizer.romanize(1600)
    assert_equal 'MDCC', @romanizer.romanize(1700)
    assert_equal 'MDCCC', @romanizer.romanize(1800)
    assert_equal 'MCM', @romanizer.romanize(1900)
    assert_equal 'MM', @romanizer.romanize(2000)
    # assert_equal 'IV', @romanizer.romanize(4)
    # assert_equal 'V', @romanizer.romanize(5)
    # assert_equal 'VI', @romanizer.romanize(6)
    # assert_equal 'VII', @romanizer.romanize(7)
    # assert_equal 'VIII', @romanizer.romanize(8)
    # assert_equal 'IX', @romanizer.romanize(9)
    # assert_equal 'X', @romanizer.romanize(10)
  end

  def test_deromanize_1_to_10
    assert_equal 1, @romanizer.deromanize('I')
    assert_equal 2, @romanizer.deromanize('II')
    assert_equal 3, @romanizer.deromanize('III')
    # assert_equal 4, @romanizer.deromanize('IV')
    # assert_equal 5, @romanizer.deromanize('V')
    # assert_equal 6, @romanizer.deromanize('VI')
    # assert_equal 7, @romanizer.deromanize('VII')
    # assert_equal 8, @romanizer.deromanize('VIII')
    # assert_equal 9, @romanizer.deromanize('IX')
    # assert_equal 10, @romanizer.deromanize('X')
  end

  private

  def load_pattern
    file_path = File.expand_path('pattern.yml', File.dirname(__FILE__))
    YAML.load_file(file_path)
  end
end
