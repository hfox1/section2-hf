require '3.3challenge'

=begin
  
FAILS
passing non-string -> Pass some text!
passing empty string -> this text is empty!
PASSES for following inputs
])(#TODO)
What #TODO now
\n#TODO\n

=end

RSpec.describe 'TODO_FINDER' do
  context "input is non-string" do
    it 'fails' do
    expect{ TODO_FINDER(3) }.to raise_error "Pass some text!"
    end
  end 

  context "input is empty string" do
    it 'fails' do
    expect{ TODO_FINDER("") }.to raise_error "this text is empty!"
    end
  end 

  it "finds a swamped #TODO" do
    result = TODO_FINDER("])(#TODO)")
    expect(result).to eq true
  end

  it "finds a #TODO within spaces" do
    result = TODO_FINDER("What #TODO now")
    expect(result).to eq true
  end

  it "finds a #TODO within newlines" do
    result = TODO_FINDER("\n#TODO\n")
    expect(result).to eq true
  end

end