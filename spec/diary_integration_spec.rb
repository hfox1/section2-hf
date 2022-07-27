require 'diary' 
require 'diary_entry'

# test that adding one entry to diary works 
# diary.all  Returns a list of instances of DiaryEntry
# returns total words in all entries
# finds best entry 
# errors: some in individual class specs 
# fail when trying to add a non- diary entry to Diary
# 


RSpec.describe "Diary & DiaryEntry integration" do 
 it "adds a single entry to diary" do 
  diary = Diary.new
  entry = DiaryEntry.new("Tuesday", "blah")
  expect(diary.add(entry)).to eq [entry]
 end

it "returns list of diary entries" do 
  diary = Diary.new
  entry1 = DiaryEntry.new("Tuesday", "blah")
  entry2 = DiaryEntry.new("Wednesday", "bloo")
  diary.add(entry1)
  diary.add(entry2)
  expect(diary.all).to eq [entry1, entry2]
end

it "returns the total wordcount of all diary entries" do 
  diary = Diary.new
  entry1 = DiaryEntry.new("Tuesday", "blah")
  entry2 = DiaryEntry.new("Wednesday", "bloo")
  diary.add(entry1)
  diary.add(entry2)
  expect(diary.count_words).to eq 2  
end

it "calculates reading time for one text correctly" do
  diary = Diary.new
  entry1 = DiaryEntry.new("Tuesday", "one two three four five")
  diary.add(entry1)
  expect(diary.reading_time(5)).to eq 1
end

it "calculates reading time for 3 texts correctly" do
  diary = Diary.new
  entry1 = DiaryEntry.new("Tuesday", "one two three four five")
  entry2 = DiaryEntry.new("Wednesday", "one two three four five")
  entry3 = DiaryEntry.new("Thursday", "one two three four five")
  diary.add(entry1)
  diary.add(entry2)
  diary.add(entry3)
  expect(diary.reading_time(15)).to eq 1
end

it "returns the the best entry from specified time" do
  diary = Diary.new
  entry1 = DiaryEntry.new("Tuesday", "blah blah")
  entry2 = DiaryEntry.new("Wednesday", "bloo, blah, bloo, blah")
  entry3 = DiaryEntry.new("Thursday", "bloo, blah, blah") 
  entry4 = DiaryEntry.new("Friday", "bloo, blah") 
  diary.add(entry1)
  diary.add(entry2)
  diary.add(entry3)
  diary.add(entry4)
  expect(diary.find_best_entry_for_reading_time(3,1)).to eq entry3
end

it "fails when trying to add something other than a diary entry to the diary" do 
  diary = Diary.new
  expect{ diary.add(1) }.to raise_error "Cannot add something that's not a diary entry!"
  expect{ diary.add("blah") }.to raise_error "Cannot add something that's not a diary entry!"
  expect{ diary.add([]) }.to raise_error "Cannot add something that's not a diary entry!"

end

end


