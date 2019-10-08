require_relative '../InputManager/api_input_manager'

RSpec.describe ApiInputManager do
  dblp = ApiInputManager.new()
  
  it 'access dblp api' do
    dblp.make_request("test")
    dblp.build_list()
    expect(dblp.title_list.size).not_to eq(0)
  end
end