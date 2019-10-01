require_relative 'input_manager'

class TxtInputManager
  include InputManager
  attr_accessor :title_list

  def initialize(path)
    @file_path = path
    @title_list = []
  end

  def print_path
    puts @file_path
  end

  # Cria uma lista na memória cujo cada elemento é o título de um dos artigos
  def read_file_lines
    text = File.open(@file_path).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      @title_list.push(line)
    end
  end
end