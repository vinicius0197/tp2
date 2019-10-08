require_relative 'InputManager/txt_input_manager'
require_relative 'InputManager/api_input_manager'
require_relative 'CircularShift/circular_shift_manager'
require_relative 'OutputManager/html_output_manager'

# Módulo que carrega o arquivo fonte de texto
txt_file = TxtInputManager.new('./input.txt')
api_file = ApiInputManager.new()
txt_file.read_file_lines()

# Módulo que usa o DBLP
dblp = ApiInputManager.new()
dblp.make_request("test")
dblp.build_list()

# Usa o módulo CircularShift para criar o dicionário de KWIC com ordenamento alfabético
kwic = CircularShift.new(dblp)
kwic.create_kwic_dict()
kwic.order()

# Usa o resultado do CircularShift para realizar o output do projeto
output_manager = HtmlOutputManager.new(kwic)
output_manager.output()
output_manager.print_console()