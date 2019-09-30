require_relative 'InputManager/txt_input_manager'
require_relative 'InputManager/api_input_manager'

# Módulo que carrega o arquivo fonte de texto
txt_file = TxtInputManager.new('./input.txt')
api_file = ApiInputManager.new()
txt_file.print_path()
txt_file.read_file_lines()
api_file.read_file_lines()