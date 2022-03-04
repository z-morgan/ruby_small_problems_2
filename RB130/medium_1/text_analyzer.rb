class TextAnalyzer
  def process
    file = File.open('./sample_text.txt', 'rt')
    yield(file.read)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split(" ").size} words" }


