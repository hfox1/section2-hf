# As a user
# So that I can keep track of my tasks
# I want a program that I can add todo tasks to and see a list of them.

# As a user
# So that I can focus on tasks to complete
# I want to mark tasks as complete and have them disappear from the list.


# Don't worry about user input & output here.


class TodoList
  def initialize # newtask is a string
  @todos = []
  end

  def add_task(task)
    fail "Please enter some text" if task == ""
    fail "That's already a task!" if @todos.include?(task)
    @todos.append(task)
  end

  def check_list(task)
    p @todos.include?(task)
  end

  def see_list 
 puts list = @todos.join(" \n")
 list
  end

  def complete(task)
    @todos.delete(task) 
  end

end

# list = TodoList.new
# list.add_task("test task")
# list.add_task("task 2")
# list.see_list
# list.check_list("task 2")
