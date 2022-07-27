require '2-8todo'

#1 user inputs a string as a new todo, the string is stored, 
# and returned as a string 
#2 user can mark as done using markdone, and ask if done
#2.1 multiple 'done's are redundant 
#errors:
#4 .new with non-string fails 
#5 .new with empty string fails 
#   
RSpec.describe Todo do
 #1 
  it "saves a new task" do
    newtodo = Todo.new("wash the car")
    expect(newtodo.task).to eq "wash the car"
  end 
  
  #2
  it "marks a task done" do 
    newtodo = Todo.new("wash the car")
    newtodo.mark_done!
    expect( newtodo.done? ).to eq true
  end

  #2.1
  it "double 'done'ing is re'done'dant" do 
    newtodo = Todo.new("wash the car")
    newtodo.mark_done!
    newtodo.mark_done!
    expect( newtodo.done? ).to eq true
  end

  #4
  it "initializing inputting non-string fails" do 
    expect{ Todo.new([]) }.to raise_error "Please input some text"
    expect{ Todo.new(5) }.to raise_error "Please input some text"
    expect{ Todo.new({}) }.to raise_error "Please input some text"
  end

  #5
  it "initializing inputting empty-string fails" do 
    expect{ Todo.new("") }.to raise_error "Please input some text"
  end



end