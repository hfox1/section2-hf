require '2-6'
# tests
# 1 init and no task added returns empty array 
# 2 adding 'walk dog' and printing returns "walk dog"
# 3 adding an empty task puts 'please add some text"
# 4 adding "walk dog", then "wash car" and printing returns "walk dog \n wash car"
# 5 adding "ring mum" to list from 4 then completing "wash car" should 
# give list "walk dog /n ring mum" 

RSpec.describe TodoList do
  # 1 init and no task added returns empty array
it "see_list returns an empty string after an init with no tasks" do 
  expect( TodoList.new.see_list ).to eq ""
end

# 2 adding 'walk dog' and printing returns "walk dog"
it "puts 'walk dog' when that's been added as a task" do 
  list = TodoList.new
  list.add_task("walk dog")
  expect(list.see_list).to eq "walk dog"
end

# 3 adding an empty task puts 'please add some text"
context "fails trying to input empty task" do
  it "asks for text if an empty task is input" do 
  expect{ TodoList.new.add_task("") }.to raise_error "Please enter some text"
  end
end

# 3.1 adding a deuplicate task puts warning
context "fails trying to add duplicate task" do
  it "fails for duplicate task" do 
    list = TodoList.new
    list.add_task("one")
  expect{ list.add_task("one") }.to raise_error "That's already a task!"
  end
end

# 4 adding "walk dog", then "wash car" and printing returns "walk dog \n wash car"
it "returns 2 tasks on separate lines" do 
  list = TodoList.new
  list.add_task("walk dog")
  list.add_task("wash car")
  expect(list.see_list).to eq "walk dog \nwash car"
end 

# 5 adding "ring mum" to list from 4 then completing "wash car" should 
# give list "walk dog /nring mum" 
it "adding 3 tasks and removing central one, printing gives 2 outside ones" do 
  list = TodoList.new
  list.add_task("walk dog")
  list.add_task("wash car")
  list.add_task("ring mum")
  list.complete("wash car")
  expect(list.see_list).to eq "walk dog \nring mum"
end 



end 