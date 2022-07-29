require '2.9diaryexerpt'
require 'diary'
require 'diary_entry'
require '2.9phonebook'

RSpec.describe "Phonebook, DiaryExerpt, Diary & DiaryEntry Integration" do 
  context "testing best_entry & DiaryExerpt" do 
    it "best_entry trivially returns one entry" do
      diary = Diary.new 
      reader = DiaryExerpt.new(diary)
      entry1 = DiaryEntry.new("tue", "job")
      diary.add(entry1)
      expect(reader.best_entry(5, 1)).to eq [entry1]
    end

    it "best_entry returns right entry" do
      diary = Diary.new 
      reader = DiaryExerpt.new(diary)
      entry1 = DiaryEntry.new("tue", "job")
      entry2 = DiaryEntry.new("wed", "job done one two")
      diary.add(entry1)
      diary.add(entry2)
      expect(reader.best_entry(3, 1)).to eq [entry1]
      expect(reader.best_entry(5, 1)).to eq [entry2]
    end

    it "best_entry returns 2 entries in a tie" do
      diary = Diary.new 
      reader = DiaryExerpt.new(diary)
      entry1 = DiaryEntry.new("tue", "job")
      entry2 = DiaryEntry.new("wed", "job done")
      entry3 = DiaryEntry.new("thur", "jib dan")
      diary.add(entry1)
      diary.add(entry2)
      diary.add(entry3)
      expect(reader.best_entry(5, 1)).to eq [entry2, entry3]
    end

    it "best_entry asks for a non-empty diary when handed one" do
      diary = Diary.new 
      exerpts = DiaryExerpt.new(diary)
      expect{ exerpts.best_entry(5,1) }.to raise_error "Please add some entries to the Diary"
    end

    it "best_entry says no good entry available when true" do
        diary = Diary.new 
        reader = DiaryExerpt.new(diary)
        entry1 = DiaryEntry.new("tue", "job one two three ")
        diary.add(entry1)
        expect(reader.best_entry(3, 1)).to eq "No whole entry is suitable"
    end

    it "new DiaryExerpt must take a diary" do 
      expect{ DiaryExerpt.new("string") }.to raise_error "Please initialize from a diary"
    end
  

    it "Best entry throws error for non-integer arg" do
      diary = Diary.new 
      reader = DiaryExerpt.new(diary)
      entry1 = DiaryEntry.new("tue", "job one two three ")
      diary.add(entry1)
      expect{ reader.best_entry("three", 1) }.to raise_error "time and wpm must be integers"
      expect{ reader.best_entry(3, "one") }.to raise_error "time and wpm must be integers"
    end
  end

  context "testing Phonebook and get_numbers" do
   xit "returns a number from an entry (in a list)" do 
      diary = Diary.new 
      pbook = Phonebook.new(diary)
      entry1 = DiaryEntry.new("Tue", "07888888881")
      diary.add(entry1)
      expect(pbook.get_numbers).to eq ["07888888881"]
    end
    
    xit "get_numbers returns numbers from 2 messages in a list" do 
      diary = Diary.new 
      pbook = Phonebook.new(diary)
      entry1 = DiaryEntry.new("Tue", "07888888881")
      entry2 = DiaryEntry.new("wed", "07888888888")
      diary.add(entry1)
      diary.add(entry2)
      expect(pbook.get_numbers).to eq ["07888888881", "07888888888"]
    end
    
    xit "get_numbers returns unique numbers in a list" do 
      diary = Diary.new 
      pbook = Phonebook.new(diary)
      entry1 = DiaryEntry.new("Tue", "07888888881, 07888888888")
      entry2 = DiaryEntry.new("wed", "07888888888")
      diary.add(entry1)
      diary.add(entry2)
      expect(pbook.get_numbers).to eq ["07888888881", "07888888888"]
    end 
    
  end

  context "testing diary & diary entry integration"
    xit "we can view entries in diary" do 
      entry1 = DiaryEntry.new("Tue", "07888888881, 07888888888")
      entry2 = DiaryEntry.new("wed", "07888888888")
      diary.add(entry1)
      diary.add(entry2)
      diary = Diary.new 
      expect(diary.view).to eq [["Tue", "07888888881, 07888888888"], ["wed", "07888888888"]]
    end

    xit "add should return nothing" do 
      diary = Diary.new 
      entry1 = DiaryEntry.new("Tue", "07888888881, 07888888888")
      expect(diary.add(entry1)).to eq nil
      end
  end    

