require 'erb'

class OutputManager
  def initialize(kwic_dict)
    @kwic_dict = kwic_dict
  end

  def print_as_html
    template = File.read('./template.html.erb')
    renderer = ERB.new(template).result(binding)

    File.open('./template.html', 'w+') do |f|
      f.write renderer
    end
  end
end