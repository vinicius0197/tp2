module InputManager
  def output
    raise NotImplementedError
  end

  def print_console
    @kwic_dict.each do |key, value|
      value.each do |line|
        puts "#{key} | #{line}"
      end
    end
  end
end