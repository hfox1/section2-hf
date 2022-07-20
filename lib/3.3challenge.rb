=begin
  USER STORY 
As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.
  
METHOD SIGNATURE
method is called 'TODO_FINDER'
'TODO_FINDER' is going to take some text (a string) to check for the string "#TODO"

argument is 'string' , a string! Raise error if not.

it's going to output a boolean, depending whether #TODO is included or not 

=end

def TODO_FINDER(string)
  fail "Pass some text!" if !string.is_a?(String)
  fail "this text is empty!" if string == ""

  string.include?("#TODO")
  
end