# require '/Users/harryfox/Projects/supra-golden-square/section2-hf/lib/diary_entry.rb' 
require_relative 'diary_entry.rb'

class Diary
  def initialize
    @diary = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    fail "Cannot add something that's not a diary entry!" if !entry.is_a?(DiaryEntry)
    # Returns nothing
    @diary << entry
    return
  end

  def all
    # Returns a list of instances of DiaryEntry
    @diary
  end

  def view
    # returns all entries in readable [title, contents] pairs 
    if @diary == [] ; return "nothing to view!"
    end
    @diary.map { |entry| a = entry.title ; b = entry.contents ; [a, b]}
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

  def reading_time(wpm) 
    fail "please enter an integer" if wpm.empty? || !wpm.is_a?(Integer)
    count_words / wpm
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    winner = nil
    distance = 10000
    perfect_length = wpm * minutes

    @diary.each do |entry|
      word_count = entry.count_words
      entry 
      if word_count <= perfect_length 
        if distance >= perfect_length - word_count 
          distance = perfect_length - word_count
          winner = entry
        end
      end

    end

    winner 
    
  end
end

# diary = Diary.new
# entry1 = DiaryEntry.new("Tuesday", "blah blah")
# entry2 = DiaryEntry.new("Wednesday", "bloo, blah, bloo, blah")
# diary.add(entry1)
# diary.add(entry2)
# p diary

