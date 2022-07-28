require 'diary_entry'

RSpec.describe DiaryEntry do 
  context "errors" do 
    it "initialize fails for non-string input" do 
      expect{ DiaryEntry.new(5, "s") }.to raise_error "Please enter text"
      expect{ DiaryEntry.new("s", 5) }.to raise_error "Please enter text"
    end
  
    it "initialize fails for empty string input" do 
      expect{ DiaryEntry.new("title", "") }.to raise_error "Please enter some content"
      expect{ DiaryEntry.new("", "contents") }.to raise_error "Please enter some content"
    end

    it "requires reading time's wpm to be integer" do 
      entry = DiaryEntry.new("title", "contents")
      expect{ entry.reading_time("14") }.to raise_error "Please enter an integer"
      expect{ entry.reading_time([]) }.to raise_error "Please enter an integer"
    end

  end
end
