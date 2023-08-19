class TextAnalyzer
  def process
    file = File.open('text.txt', 'rt')
    yield(file)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.read.split("\n\n").size} paragraphs" }
analyzer.process { |file| puts "#{file.read.split("\n").size} lines" }
analyzer.process { |file| puts "#{file.read.split.size} words" }




# 3 paragraphs
# 15 lines
# 126 words


# how to open and close a file
# use File.open, and pass it the file name as a string. Also pass the mode as another argument


# what does File#read do?