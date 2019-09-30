require_relative 'input_manager'

# Módulo que carrega o arquivo fonte de texto
txt_file = InputManager.new('./input.txt')
txt_file.print_path()
txt_file.read_file_lines()