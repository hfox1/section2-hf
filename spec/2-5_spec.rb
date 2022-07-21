require '2-5'

RSpec.describe DiaryEntry do 
 # title tests 
  context "empty title returns error" do 
    it "asks for a title" do 
      entry = DiaryEntry.new("", "Dear Diary, today I ate creams.")
    expect{ entry.title }.to raise_error "Please add a title"
    end
  end

    context "nontext title returns error" do 
      it "asks for a title as text" do 
        entry = DiaryEntry.new(6, "Dear Diary, today I ate creams.")
      expect{ entry.title }.to raise_error "Please enter text"
      end
    end

    it "calling title returns the title" do 
      entry = DiaryEntry.new("Tuesday", "Dear Diary, today I ate creams.")
      result = entry.title 
      expect(result).to eq "Tuesday"
    end

# contents tests
    context "nontext contents returns error" do 
      it "asks for text" do 
        entry = DiaryEntry.new("Tuesday", 6)
      expect{ entry.contents }.to raise_error "Please enter text"
      end
    end
  
    context "empty contents returns error" do 
      it "asking for contents" do 
        entry = DiaryEntry.new("Tuesday", "")
        expect{ entry.contents }.to raise_error "Please add some text"
      end
    end

    it "returns contents when called" do 
      entry = DiaryEntry.new("Tuesday", "Dear Diary, today I ate creams.")
      result = entry.contents 
      expect(result).to eq "Dear Diary, today I ate creams."
    end

    # count_words tests
    it "count_words returns 0 when given empty string" do
      entry = DiaryEntry.new("Tuesday", "")
      result = entry.count_words
      expect(result).to eq 0
    end
    it "count_words returns 1 when given 1 word" do
      entry = DiaryEntry.new("Tuesday", "foo")
      result = entry.count_words
      expect(result).to eq 1
    end
    it "count_words returns 10 when given 10 words" do
      entry = DiaryEntry.new("Tuesday", "one two three four five six seven eight nine ten")
      result = entry.count_words
      expect(result).to eq 10
    end
   




end


