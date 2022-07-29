require '2-8todo'
require '2-8todo_list'

#user make a new todo list 
# user adds a todo, to the list - DONE
# user can return all unfinished todos - DONE
# user can return all complete todos
# user can give up and mark all todos as complete 

RSpec.describe "Todo and TodoList integration" do 
  context "get add to work" do 
    list = TodoList.new
    task = Todo.new("wash car")
    task2 = Todo.new("catch a plane")

    it "adding a task returns nothing" do 
      expect( list.add(task) ).to eq nil
    end 
    
    it "creates a new list, and adds a task, which is then incomplete" do 
      list.add(task2)
      expect( list.incomplete ).to eq [task, task2]
    end

    it "fails trying to add a non-todo" do 
      expect{ list.add("bath cat") }.to raise_error "Please add a todo"
    end
  end


  it "returns a list of completed tasks" do 
    list = TodoList.new
    task = Todo.new("wash car")
    task2 = Todo.new("catch a plane")
    list.add(task)
    list.add(task2)
    task.mark_done!
    expect( list.complete ).to eq [task]
    expect( list.incomplete ).to eq [task2]
  end
  
  it "giving up marks all todos as complete" do 
    list = TodoList.new
    task = Todo.new("wash car")
    task2 = Todo.new("catch a plane")
    list.add(task)
    list.add(task2)
    list.give_up!
    expect( list.complete ).to eq [task, task2]
    expect( list.incomplete ).to eq []
  end

  # from 2.9 
  it "view a todo added to todolist" do
    list = TodoList.new 
    task1 = Todo.new("wash baby")
    task2 = Todo.new("wash lady")
    list.add(task1)
    list.add(task2)
    expect(list.view).to eq ["wash baby", "wash lady"]
  end

  context "checking methods on a empty Todolist" do 
    list = TodoList.new
  
  # view blank to do list 
    it "viewing blank todolist returns empty list" do 
      expect(list.view).to eq []
    end
  end
end
