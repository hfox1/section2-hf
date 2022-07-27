require '2-8todo_list'

#user make a new todo list 
# user adds a todo, to the list 
# user can return all unfinished todos 
# user can return all complete todos
# user can give up and mark all todos as complete 

RSpec.describe TodoList do 
  #1 add a blank will error (already done)
  
  context "checking methods on a empty Todolist" do 
    list = TodoList.new

  # incomplete method on blank is []
    it "incomplete returns []" do 
      expect(list.incomplete).to eq []
    end

    # complete method on blank is []
    it "complete returns []" do 
      expect(list.complete).to eq []
    end

     # give up method throws no error
     it "give up returns nil" do 
      expect(list.give_up!).to eq []
    end

  end





end

