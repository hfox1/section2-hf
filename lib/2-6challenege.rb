# As a user
# So that I can keep track of my music listening
# I want to add tracks I've listened to and see a list of them.

class ListeningLog
  def initialize 
  @log = []
  end


  def add_track(track)
    fail "Please enter text" if track != track.to_s 
  @log << track

  end 

  def see_tracks
    @log
  end
  
end 

