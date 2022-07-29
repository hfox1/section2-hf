require 'diary'
# require 'diary_entry.rb'

RSpec.describe Diary do 

  it "view on an empty diary returns 'nothing to view!'" do
    expect(Diary.new.view).to eq "nothing to view!" 
  end

  context "errors" do 
    it "wpm for reading time is empty or non-integer" do
      diary = Diary.new
      expect{ diary.reading_time({}) }.to raise_error "please enter an integer"
      expect{ diary.reading_time([]) }.to raise_error "please enter an integer"
      expect{ diary.reading_time("fourteen") }.to raise_error "please enter an integer"
    end
  end

end