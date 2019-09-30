class InputManager
  def initialize(path)
    @file_path = path
  end

  def print_path
    puts @file_path
  end

  def read_file_lines
    line_num = 0
    text = File.open(@file_path).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      puts "#{line_num += 1} #{line}"
    end
  end
end