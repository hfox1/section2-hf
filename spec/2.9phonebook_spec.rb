require 'phonebook'

RSpec.describe Phonebook do 

  it "throws error for non-diary phonebook init" do 
    expect{ Phonebook.new("string") }.to raise_error "Must take a Diary instance"
  end 

end 
