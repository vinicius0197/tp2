require_relative 'InputManager/txt_input_manager'
require_relative 'InputManager/api_input_manager'
require_relative 'CircularShift/circular_shift_manager'
require_relative 'OutputManager/output_manager'

# Módulo que carrega o arquivo fonte de texto
txt_file = TxtInputManager.new('./input.txt')
api_file = ApiInputManager.new()
txt_file.print_path()
txt_file.read_file_lines()

# Usa o módulo CircularShift para criar o dicionário de KWIC com ordenamento alfabético
my_shift = CircularShift.new(txt_file.title_list)
my_dict = my_shift.create_kwic_dict()
my_shift.order()
puts my_shift.kwic_dict

# Usa o resultado do CircularShift para realizar o output do projeto
html_output_manager = OutputManager.new(my_shift.kwic_dict)
html_output_manager.print_as_html()