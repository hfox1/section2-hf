# require '/Users/harryfox/Projects/supra-golden-square/section2-hf/lib/diary_entry.rb' 
require_relative 'diary_entry.rb'

class Diary
  def initialize
    @diary = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
    @diary << entry
  end

  def all
    # Returns a list of instances of DiaryEntry
    @diary
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    counter = 0
    @diary.each do |entry|
      counter += entry.count_words
    end
    counter

  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
   # collection = {}
    winner = nil
    distance = 100

    @diary.each do |entry|
      word_count = entry.count_words
      p entry 
     # collection << [entry, entry.count_words]
    
      perfect_length = wpm * minutes
      # if word_count <= perfect_length
        
        if distance >= perfect_length - word_count # distance = 100 // perfect_length = 3 // word_count = 2
          distance = perfect_length - word_count
          winner = entry

        end
      # end
    end

    p winner 
    
  end
end

diary = Diary.new
entry1 = DiaryEntry.new("Tuesday", "blah blah")
entry2 = DiaryEntry.new("Wednesday", "bloo, blah, bloo, blah")
diary.add(entry1)
diary.add(entry2)
p diary.find_best_entry_for_reading_time(3,1)
