require '/Users/harryfox/Projects/supra-golden-square/section2-hf/lib/2-5.rb'

teststring4 = (1..900).to_a.map! { |x| x.to_s }.join(" ")
# "final 5 words of chunk1 + first 5 words of consecutive chunk = 
# 10 word chunk starting 5 before the end of chunk1 " 

entry1 = DiaryEntry.new("it's entry 1", teststring4)
entry2 = DiaryEntry.new("it's entry 2", teststring4)

chunk1_words = entry1.reading_chunk(200, 2).split(" ")
chunk2_words = entry1.reading_chunk(200, 2).split(" ")
p last_5_words_of_chunk1 = chunk1_words[ (chunk1_words.length - 5), (chunk1_words.length + 1) ]
p first_5_words_of_chunk2 = chunk2_words[0, 6]
p chunk1_words.length 
p "*******"
p chunk3 = entry2.reading_chunk((395), 1)
p "---------"
p chunk4_words = entry2.reading_chunk(10, 1).split(" ")
p last_5_words_of_chunk1 << first_5_words_of_chunk2 == chunk3
