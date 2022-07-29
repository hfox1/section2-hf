require '/Users/harryfox/Projects/supra-golden-square/section2-hf/lib/diary.rb'
require '/Users/harryfox/Projects/supra-golden-square/section2-hf/lib/diary_entry.rb'

class DiaryExerpt 
  def initialize(diary)
    fail "Please initialize from a diary" if !diary.is_a?(Diary)
    @diary = diary 
  end

  def best_entry(wpm, minutes)
    fail "Please add some entries to the Diary" if @diary.all == []
    fail "time and wpm must be integers" if (!wpm.is_a?(Integer) || !minutes.is_a?(Integer))
    
    winner = [@diary.all[0]]
    perfect_length = wpm * minutes

    @diary.all.each do |entry|
      if entry.count_words <= perfect_length 
        best_distance_yet = perfect_length - winner[0].count_words 
        new_distance = perfect_length - entry.count_words
        next if entry == @diary.all[0]
        if new_distance < best_distance_yet
          winner = [entry]
        elsif new_distance == best_distance_yet
          winner << entry 
        end
      end
    end
   
    if (winner == [@diary.all[0]]) && (@diary.all[0].count_words > perfect_length)
      "No whole entry is suitable"
    else winner 
    end

    

    
  end

end
diary = Diary.new 
reader = DiaryExerpt.new(diary)
entry1 = DiaryEntry.new("tue", "job one two three ")
diary.add(entry1)
reader.best_entry(3, 1)
