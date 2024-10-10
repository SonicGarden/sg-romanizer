class SgRomanizer
  def romanize(_arabic)
    load_pattern[_arabic]
  end

  def deromanize(roman)
    load_pattern.key(roman)
  end

  private

  def load_pattern
    file_path = File.expand_path('pattern.yml', File.dirname(__FILE__))
    YAML.load_file(file_path)
  end
end
