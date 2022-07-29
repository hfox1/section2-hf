require '/Users/harryfox/Projects/supra-golden-square/section2-hf/lib/diary.rb'
require '/Users/harryfox/Projects/supra-golden-square/section2-hf/lib/diary_entry.rb'

class Phonebook 
  def initialize(diary)
    @diary = diary
  end 

  def get_numbers
    numbers = @diary.all.map { |entry| entry.contents.gsub(/[^0-9 ]/, "") }
    cleaned = numbers.map { |multiplenumbers| multiplenumbers.split}
    cleaned.reduce(:+).uniq
 
  end 

end

# diary = Diary.new 
# pbook = Phonebook.new(diary)
# entry1 = DiaryEntry.new("Tue", "07888888881,, 07888888888, words")
# entry2 = DiaryEntry.new("wed", "07888888888 is my friend")
# diary.add(entry1)
# diary.add(entry2)
# p pbook.get_numbers

# s = "one 07888888881,"

# p s.gsub(/[^0-9 ]/, "")
