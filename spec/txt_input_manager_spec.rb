require_relative '../InputManager/txt_input_manager'

RSpec.describe TxtInputManager do
  txt_file = TxtInputManager.new('./input.txt')
  
  it 'reads txt file' do
    txt_file.read_file_lines()
    expect(txt_file.title_list.size).not_to eq(0)
  end
end