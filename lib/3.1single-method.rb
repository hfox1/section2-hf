def reading_time(string)
  word_count = string.split(" ").length
  minutes = word_count.to_f / 200.00
  
  
  return "The reading time for this text is #{minutes} minute(s)." 
end

=begin
Method Signature 

method name is 'reading time'
it takes a single parameter 'string' that could be loads of words 
'word_count' returns the length of an array created by splitting that string into words 
'minutes' is the raw reading time in mins
the method returns a string with interpolation, and has no other side effects 


=end

