require 'erb'

class OutputManager
  def initialize(kwic)
    @kwic_dict = kwic.kwic_dict
  end

  def print_as_html
    template = File.read('./template.html.erb')
    renderer = ERB.new(template).result(binding)

    File.open('./template.html', 'w+') do |f|
      f.write renderer
    end
  end

  def print_console
    @kwic_dict.each do |key, value|
      value.each do |line|
        puts "#{key} | #{line}"
      end
    end
  end
end