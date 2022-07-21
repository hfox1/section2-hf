=begin
  Method Signature
user story:
As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and 
ends with a suitable sentence-ending punctuation mark.

boolean = checker(string)
the 'checker' method takes a string as input, and outputs a boolean  

it has no side effects 

=end

def checker(string)
  fail "empty or incorrect input!" if (string == "" || !(string.is_a?(String)))
  string[0] == string[0].upcase &&
  [".", "?", "!"].include?(string[-1])
end
