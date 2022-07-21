require '2-5'

RSpec.describe DiaryEntry do 
 # initialize tests 
  context "empty title returns error" do 
    it "asks for a title" do 
    expect{ DiaryEntry.new("", "Dear Diary, today I ate creams.") }.to raise_error "Please add a title"
    end
  end

  context "nontext title returns error" do 
    it "asks for a title as text" do 
    expect{ entry = DiaryEntry.new(6, "Dear Diary, today I ate creams.") }.to raise_error "Please enter text"
    end
  end

  context "nontext contents returns error" do 
    it "asks for text" do 
    expect{ DiaryEntry.new("Tuesday", 6) }.to raise_error "Please enter text"
    end
  end

  context "empty contents returns error" do 
    it "asking for contents" do 
      expect{ DiaryEntry.new("Tuesday", "") }.to raise_error "Please add some text"
    end
  end

  # title tests 
  it "calling title returns the title" do 
    entry = DiaryEntry.new("Tuesday", "Dear Diary, today I ate creams.")
    result = entry.title 
    expect(result).to eq "Tuesday"
  end

# contents tests
  it "returns contents when called" do 
    entry = DiaryEntry.new("Tuesday", "Dear Diary, today I ate creams.")
    result = entry.contents 
    expect(result).to eq "Dear Diary, today I ate creams."
  end

  # count_words tests
  # no fail tests 
  
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
   
  # reading time tests 

  context "non integer supplied" do
    it "prompts for integer" do 
      entry = DiaryEntry.new("Tuesday", "one two")
      expect{ entry.reading_time("two hundred") }.to raise_error "wpm must be a number"
    end
  end

  context "wpm = 0" do
    it "states wpm !=0" do 
      entry = DiaryEntry.new("Tuesday", "one two")
      expect{ entry.reading_time(0) }.to raise_error "wpm cannot be 0"
    end
  end


  teststring = Array.new(200,"water").join(" ")
  teststring2 = Array.new(100,"water").join(" ")
  teststring3 = Array.new(550,"water").join(" ")
  
  it "outputs one minute for 200 words at 200wpm" do
    entry = DiaryEntry.new("title", teststring)
    result = entry.reading_time(200)
    expect(result).to eq 1 
  end

  it "outputs one minute for 100 words at 200wpm" do
    entry = DiaryEntry.new("title", teststring2)
    result = entry.reading_time(200)
    expect(result).to eq 1 
  end

  it "outputs 3 minutes for 550 words at 200wpm" do
    entry = DiaryEntry.new("title", teststring3)
    result = entry.reading_time(200)
    expect(result).to eq 3 
  end
  
  # reading chunk tests 
  # 1. for 1 min should return wpm number of words (try wpm = eg. 1, 300)
  # 2.1 to check next chunk, first chunk should not be part of second chunk 
  # 2.2 if next chunk reaches end, it should stop at the end 
  # 3. should output first chunk again after reaching the end 

  it "for 1 min, outputs chunk of size = wpm" do 
  entry = DiaryEntry.new("title", teststring3)
  result = entry.reading_chunk(200, 1)
  expect(result.split(" ").length).to eq 200
  end
  
  # 2.1
  it "subsequent chunk should not contain passage longer than 50 words of previous one" do
    entry = DiaryEntry.new("title", teststring3)

end






