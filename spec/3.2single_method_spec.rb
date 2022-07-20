require '3.2single_method'

=begin
  
Test cases: 
empty string input -> fail, "not a sentence!"
single word input -> normal tests apply 
strings that should pass: 
Hello World.
Hello world! 
HELLO, world? 
strings that should fail 
hello, world. 
Hello world,


unexamined in user story: 
Hello. world.

=end

RSpec.describe 'single_method' do
  context "given an empty string input" do
    it 'fails' do
      expect { checker("") }.to raise_error "empty or incorrect input!"
    end
  end

  context "given non-string" do
    it 'fails' do
      expect { checker(5) }.to raise_error "empty or incorrect input!"
    end
  end

    it 'returns false for uncapitalised, correctly punctuated text' do 
      result = checker("hello, world.")
      expect(result).to eq false
    end
  
    it 'falses Capitalized, incorrectly punctuated text' do
      result = checker("Hello world,")
      expect(result).to eq false
    end
  
    it "returns true for full stop" do
    result = checker("Hello world.")
    expect(result).to eq true
    end

    it "returns true for bang" do
      result = checker("Hello world!")
      expect(result).to eq true
    end

    it "returns true for bang" do
      result = checker("Hello world!")
      expect(result).to eq true
    end

    it "returns true for capped first word" do
      result = checker("HELLO world.")
      expect(result).to eq true
    end

end