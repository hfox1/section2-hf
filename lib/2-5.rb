class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents 
    @start_at_word = 0
    fail "Please enter text" if (@title != @title.to_s)
    fail "Please add a title" if @title.empty?
    fail "Please enter text" if (@contents != @contents.to_s)
    fail "Please add some text" if @contents.empty?
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
     @contents.split(" ").length   
  end      

  def reading_time(wpm)
    fail "wpm must be a number" if !wpm.is_a?(Numeric)
    fail "wpm cannot be 0" if wpm == 0 
    word_count = @contents.split(" ").length
    minutes = count_words.to_f / wpm
    minutes.round  
  end

  def reading_chunk(wpm, minutes) 
    # p "start at word: #{@start_at_word}" 

    chunksize = wpm * minutes

    chunk = @contents.split(" ")[@start_at_word, @start_at_word + chunksize].join(" ")
    
    if chunk.empty?
      @start_at_word = 0
      chunk = @contents.split(" ")[@start_at_word, @start_at_word + chunksize].join(" ")
    end
    
    @start_at_word += chunksize
    # p "start at word: #{@start_at_word}" 
    chunk
  end


                                  # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  
end

teststring = Array.new(200,"water").join(" ")
teststring2 = Array.new(300,"fire").join(" ")
teststring3 = Array.new(550,"water").join(" ")
teststring4 = (1..900).to_a.map! { |x| x.to_s}.join(" ")

entry = DiaryEntry.new("title", teststring + teststring2)
entry.reading_chunk(200, 1)

