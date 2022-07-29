class TodoList
  def initialize
    @list = []
  end

  def add(todo) 
    fail "Please add a todo" if todo.class != Todo
    @list << todo 
    return
  end

  def view
    @list.map { |todo| todo.task }
  end

  def incomplete
    # Returns all non-done todos
    @list.reject(&:done?)

  end

  def complete
    # Returns all complete todos
    @list.select(&:done?)
    
  end

  def give_up!
    # Marks all todos as complete
    @list.each(&:mark_done!)
  end
end

# list = TodoList.new
# p list.incomplete 
# p list.complete
# list.give_up!