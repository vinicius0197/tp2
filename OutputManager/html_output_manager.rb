require_relative 'output_manager'
require 'erb'

class HtmlOutputManager
  # @kwic = Objeto da classe CircularShift, que deve possui um atributo chamado @kwic_dict,
  # que é um hash cujas chaves são as keywords e valores são os títulos.
  include InputManager

  def initialize(kwic)
    @kwic_dict = kwic.kwic_dict
  end

  def output
    template = File.read('./template.html.erb')
    renderer = ERB.new(template).result(binding)

    File.open('./template.html', 'w+') do |f|
      f.write renderer
    end
  end
end