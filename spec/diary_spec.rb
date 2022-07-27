require 'diary'
# require 'diary_entry.rb'

RSpec.describe Diary do 

  context "errors" do 
    it "wpm for reading time is empty or non-integer" do
      diary = Diary.new
      expect{ diary.reading_time({}) }.to raise_error "please enter an integer"
      expect{ diary.reading_time([]) }.to raise_error "please enter an integer"
      expect{ diary.reading_time("fourteen") }.to raise_error "please enter an integer"
    end
  end



end