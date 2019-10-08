require_relative '../CircularShift/circular_shift_manager'
require_relative '../InputManager/txt_input_manager'

RSpec.describe CircularShift do
  txt_file = TxtInputManager.new('./input.txt')
  txt_file.read_file_lines()
  kwic = CircularShift.new(txt_file)
  
  it 'gets stopwords from txt file' do
    expect(kwic.stopwords.size).not_to eq(0)
  end

  it 'creates a hash with keywords' do
    kwic.create_kwic_dict()
    expect(kwic.kwic_dict.empty?).to be false
  end
end