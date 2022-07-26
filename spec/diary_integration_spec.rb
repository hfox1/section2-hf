require 'diary' 
require 'diary_entry'

# test that adding one entry to diary works 
# diary.all  Returns a list of instances of DiaryEntry
# returns total words in all entries
# finds best entry 
# errors:
# add(entry) fails "please input an entry"


RSpec.describe "Diary & Diary Entry integration" do 
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
# finds best entry 

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




end


