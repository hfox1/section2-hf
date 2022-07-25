# File: lib/music_library.rb

class MusicLibrary
    def initialize
      # ...
      @track_list = []
    end
  
    def add(track) # track is an instance of Track
      # Track gets added to the library
      # Returns nothing

      @track_list << track
    end
  
    def all
      # Returns a list of track objects
      @track_list
    end
    
    def search_by_title(keyword) # keyword is a string
      # Returns a list of tracks with titles that include the keyword
      @track_list.select do |track| 
        # track.title == keyword ? track.title : nil
        track.title.include?(keyword)
      end
    end
  end