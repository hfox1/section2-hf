# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary
 ( perhaps we're using our previous diary code )

As a user
So that I can reflect on my experiences
I want to read my past diary entries
 ( some idea of returning past entries )

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed
 ( something about selecting best entry based on time and wpm )

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary
 (very simple todo list, viewing tasks only)

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries
 (scrape phone numbers from diary entries, store and return a list subsequently)


## 2. Design the Class System

           ┌──────────────────────┐
           │   Diary Reader       │
           │     init             │
           │                      │
      ┌────►                      │
      │    │     best entry       │
      │    │                      │
      │    └──────────────────────┘
      │
      │      ┌───────────────────┐      ┌────────────────────┐
      └──────┤  Diary Class      │      │Diary Entries Class │
             │   init            │      │  init              │
             │   add entries     │◄─────┤  contents          │
             │   viewing entries │      │  title             │
         ┌───┤                   │      │  wordcount         │
         │   │                   │      └────────────────────▼
         │   └───────────────────┘
         │
         │     ┌─────────────────┐       ┌──────────────────┐
         │     │Todo class       │       │  task class      │
         │     │ init            │       │   init           │
         │     │ add             │◄──────┤   text           │
         │     │ view            │       │                  │
         │     ├─────────────────┤       └──────────────────┘
         │     ├─────────────────┤
         │     │ Phonebook       │
         └─────►  init           │
               │  get numbers    │
               │                 │
               └─────────────────┘


```ruby
class DiaryReader 
  def initialize
  end 
  
  def best_entry
  end 
end

class Phonebook 
  def initialize
  end 
  
  def get_numbers
  end 
end

class Diary
  def initialize
  end 
  
  def add(diaryentry)
  end 

  def view
  end
end

class DiaryEntry
  def initialize
  end 
  
  def title
  end 

  def contents
  end

  def wordcount
  end
end

class TodoList
  def initialize
  end 
  
  def add
  end 

  def view
  end
end

class Todo
  def initialize
  end 
  
  def text
  end 
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
...
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


